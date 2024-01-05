package com.m2m.fo.util;

import com.m2m.fo.constants.CommonConstants;

import lombok.extern.slf4j.Slf4j;

import java.security.Key;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.DESedeKeySpec;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.stereotype.Component;


@Slf4j
@Component
public class CryptoUtil {
	
	private CryptoUtil() {
		log.debug(CryptoUtil.class.getSimpleName());
	}
	
	// 알고리즘 상수
	public static final String MD_SHA1 = "MD_SHA1";
	public static final String MD_SHA256 = "SHA-256";
	public static final String MD_SHA512 = "SHA-512";
	public static final String MD_MD5 = "MD_MD5";
	
	public static final String CHIPER_DES = "DES";
	public static final String CHIPER_DES3 = "DESede";
	public static final String CHIPER_AES = "AES";
	public static final String CHIPER_AES256 = "AES/CBC/PKCS5Padding";
	
	// TYPE 상수
	public static final String MD = "MD";
	public static final String CHIPER = "CHIPER";
	
	private static final int KEY_SIZE_128 = 128;
	private static final int KEY_SIZE_256 = 256;

	private static String aes_key = CommonConstants.CRYPTO_AES_KEY;
	
	private static String aes_iv= CommonConstants.CRYPTO_IV_KEY;
	
	private static String aes256_key = CommonConstants.CRYPTO_AES256_KEY;
	
	private static String aes256_iv= CommonConstants.CRYPTO_IV256_KEY;
	
	private static String des_key = CommonConstants.CRYPTO_DES_KEY;;
	
	private static String desede_key= CommonConstants.CRYPTO_DESEDS_KEY;;
	
	/**
	 * <pre>
     * CHIPER_DES 방식의 암호화. 대칭형
	 * </pre>
	 * @param str
	 * @return
	 * @throws Exception
	 */
	public static String encryptDES(String str) throws Exception {
		return encryptChiper(CHIPER_DES, str);
	}
	
	/**
	 * <pre>
     * CHIPER_DES 방식의 복호화. 대칭형
	 * </pre>
	 * @param str
	 * @return
	 * @throws Exception
	 */
	public static String decryptDES(String str) throws Exception {
		return decryptChiper(CHIPER_DES, str);
	}
	
	/**
	 * <pre>
     * CHIPER_DES3(Triple) 방식의 암호화. 대칭형
	 * </pre>
	 * @param str
	 * @return
	 * @throws Exception
	 */
	public static String encryptDES3(String str) throws Exception {
		return encryptChiper(CHIPER_DES3, str);
	}
	
	/**
	 * <pre>
     * CHIPER_DES3(Triple) 방식의 복호화. 대칭형
	 * </pre>
	 * @param encrypted
	 * @return
	 * @throws Exception
	 */
	public static String decryptDES3(String encrypted) throws Exception {
		return decryptChiper(CHIPER_DES3, encrypted);
	}
	
	/**
	 * <pre>
     * CHIPER_AES 방식의 암호화
	 * </pre>
	 * @param encrypted
	 * @return
	 * @throws Exception
	 */
	public static String encryptAES(String encrypted) throws Exception {
		return encryptChiper(CHIPER_AES, encrypted);
	}
	
	/**
	 * <pre>
     * CHIPER_AES 방식의 복호화
	 * </pre>
	 * @param encrypted
	 * @return
	 * @throws Exception
	 */
	public static String decryptAES(String encrypted) throws Exception {
		return decryptChiper(CHIPER_AES, encrypted);
	}
	
	/**
	 * <pre>
     * CHIPER_AES 방식의 암호화
	 * </pre>
	 * @param encrypted
	 * @return
	 * @throws Exception
	 */
	public static String encryptAES256(String encrypted) throws Exception {
		return encryptChiper256(CHIPER_AES256, aes256_iv, encrypted);
	}
	
	/**
	 * <pre>
     * CHIPER_AES 방식의 복호화
	 * </pre>
	 * @param encrypted
	 * @return
	 * @throws Exception
	 */
	public static String decryptAES256(String encrypted) throws Exception {
		return decryptChiper256(CHIPER_AES256, aes256_iv, encrypted);
	}
	
	/** 고정키 정보 **/
	private static String key(String algorithm) {
		String key = "";
		if ( CHIPER_AES.equals(algorithm) ) {
			key = aes_key;
		} else if ( CHIPER_DES.equals(algorithm) ) {
			key = des_key;
		} else if ( CHIPER_DES3.equals(algorithm) ) {
			key = desede_key;
		}
		
		return key;
	}
	
	/**
	 * <pre>
     * Cipher의 instance 생성시 사용될 값
	 * </pre>
	 * @param algorithm
	 * @return
	 * @throws Exception
	 */
	private static String getInstance(String algorithm) throws Exception {
		String result = null;
		
		if ( CHIPER_AES.equals(algorithm) ) {
			result = "AES/CBC/PKCS5Padding";
		} else if ( CHIPER_DES.equals(algorithm) ) {
			result = "DES/CBC/PKCS5Padding";
		} else if ( CHIPER_DES3.equals(algorithm) ) {
			result = "DESede/CBC/PKCS5Padding";
		}
		
		return result;
	}
	
	/**
	 * <pre>
     * 키값 구하기
	 * </pre>
	 * @param algorithm
	 * @return
	 * @throws Exception
	 */
	private static Key getKey(String algorithm) throws Exception {
		Key result = null;
		byte[] key;
		
		if ( CHIPER_AES.equals(algorithm) ) {
			key = Arrays.copyOf(key(algorithm).getBytes(), KEY_SIZE_128 / 8); // 128bit, 16byte
			result = new SecretKeySpec(key, algorithm);
		} else if ( CHIPER_DES.equals(algorithm) ) {
			DESKeySpec desKeySpec = new DESKeySpec(key(algorithm).getBytes());
			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(algorithm);
			result = keyFactory.generateSecret(desKeySpec);
		} else if ( CHIPER_DES3.equals(algorithm) ) {
			DESedeKeySpec desKeySpec = new DESedeKeySpec(key(algorithm).getBytes());
			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(algorithm);
			result = keyFactory.generateSecret(desKeySpec);
		}
		
		return result;
	}
	
	/**
	 * <pre>
     * Cipher 암호화. 암호화 후 BASE64Encoding
	 * </pre>
	 * @param algorithm
	 * @param codedStr
	 * @return
	 * @throws Exception
	 */
	private static String encryptChiper(String algorithm, String codedStr) throws Exception {
		if (codedStr == null || codedStr.length() == 0) return "";
		
		Cipher cipher = Cipher.getInstance(getInstance(algorithm));
		byte[] iv = aes_iv.getBytes("UTF-8");
		
		// Key size 맞춤 (128bit, 16byte)
		iv = Arrays.copyOf(iv, KEY_SIZE_128 / 8);
		IvParameterSpec ips = new IvParameterSpec(iv);
		cipher.init(Cipher.ENCRYPT_MODE, getKey(algorithm), ips);
		
		byte[] inputBytes = codedStr.getBytes("UTF-8");
		byte[] encrypted = cipher.doFinal(inputBytes);
		
		Base64 base64 = new Base64();
		
		return base64.encodeToString(encrypted);
	}
	
	/**
	 * <pre>
     * Cipher 복호화. BASE64Decoding 후 복호화
	 * </pre>
	 * @param algorithm
	 * @param str
	 * @return
	 * @throws Exception
	 */
	private static String decryptChiper(String algorithm, String str) throws Exception {
		if ( str == null || str.length() == 0 ) return "";
		
		Cipher cipher = Cipher.getInstance(getInstance(algorithm));
		byte[] iv = aes_iv.getBytes("UTF-8");
		
		//Key size 맞춤 (128bit, 16byte)
		iv = Arrays.copyOf(iv, KEY_SIZE_128 / 8);
		IvParameterSpec ips = new IvParameterSpec(iv);
		cipher.init(Cipher.DECRYPT_MODE, getKey(algorithm), ips);
		
		Base64 base64 = new Base64();
		byte[] inputBytes = base64.decode(str);
		byte[] decrypted = cipher.doFinal(inputBytes);
		
		return new String(decrypted, "UTF-8");
	}
	
	/**
	 * <pre>
	 * Cipher 암호화. 암호화 후 BASE64Encoding (AES256)
	 * </pre>
	 * @param algorithm
	 * @param codedStr
	 * @return
	 * @throws Exception
	 */
	private static String encryptChiper256(String algorithm, String aesIv, String str) throws Exception {
		if (str == null || str.length() == 0) return "";
		
		Cipher cipher = Cipher.getInstance(algorithm);
        SecretKeySpec keySpec = new SecretKeySpec(aes256_key.getBytes(), "AES");
        IvParameterSpec ivParamSpec = new IvParameterSpec(aesIv.getBytes());
        cipher.init(Cipher.ENCRYPT_MODE, keySpec, ivParamSpec);

        byte[] encrypted = cipher.doFinal(str.getBytes("UTF-8"));
        return java.util.Base64.getEncoder().encodeToString(encrypted);
	}
	
	/**
	 * <pre>
     * Cipher 복호화. BASE64Decoding 후 복호화 (AES256)
	 * </pre>
	 * @param algorithm
	 * @param str
	 * @return
	 * @throws Exception
	 */
	private static String decryptChiper256(String algorithm, String aesIv, String str) throws Exception {
		if ( str == null || str.length() == 0 ) return "";
		
		Cipher cipher = Cipher.getInstance(algorithm);
        SecretKeySpec keySpec = new SecretKeySpec(aes256_key.getBytes(), "AES");
        IvParameterSpec ivParamSpec = new IvParameterSpec(aesIv.getBytes());
        cipher.init(Cipher.DECRYPT_MODE, keySpec, ivParamSpec);

        byte[] decodedBytes = java.util.Base64.getDecoder().decode(str);
        byte[] decrypted = cipher.doFinal(decodedBytes);
        return new String(decrypted, "UTF-8");
	}
	
	/**
	 * <pre>
     * MD_SHA1 암호화
	 * </pre>
	 * @param value
	 * @return
	 */
	public static String encryptSHA1(String value) {
		return getMessageDigest(MD_SHA1, value);
	}
	
	/**
	 * <pre>
     * SHA-256 암호화
	 * </pre>
	 * @param value
	 * @return
	 */
	public static String encryptSHA256(String value) {
		return getMessageDigest(MD_SHA256, value);
	}
	
	/**
	 * <pre>
     * SHA-512 암호화
	 * </pre>
	 * @param value
	 * @return
	 */
	public static String encryptSHA512(String value) {
		return getMessageDigest(MD_SHA512, value);
	}
	
	/**
	 * <pre>
     * MD_MD5 암호화
	 * </pre>
	 * @param value
	 * @return
	 */
	public static String encryptMD5(String value) {
		return getMessageDigest(MD_MD5, value);
	}
	
	/**
	 * <pre>
     * MD 방식 암호. 단방향
	 * </pre>
	 * @param algorithm
	 * @param value
	 * @return
	 */
	private static String getMessageDigest(String algorithm, String value) {
		MessageDigest digest = null;
		StringBuilder strResult = new StringBuilder();
//		StringBuffer strResult = new StringBuffer();
		
		if ( value == null ) {
			throw new RuntimeException("No Value For Encrypt");
		}
		
		try {
			digest = MessageDigest.getInstance(algorithm);
			digest.update(value.getBytes());
			
			byte[] messageDigest = digest.digest();
			
			
			for ( int i = 0; i < messageDigest.length; i++ ) {
				strResult.append(Integer.toString((messageDigest[i] & 0xff) + 0x100, 16).substring(1));
			}
		} catch (NoSuchAlgorithmException e) {
			log.error("biz.exception.system.noSuchAlgorithm", e);
		}
		
		return strResult.toString();
	}
}
