<?php
class SecurityHelper{
	static function encrypt($plaintext){
		//-- mungkin nanti ada sisip injeksi skrip
		$result = Core::encrypt($plaintext);
		return $result;
	}

	static function decrypt($ciphertext){
		//-- mungkin nanti ada sisip injeksi skrip

		$result = Core::decrypt($ciphertext);
		return $result;
	}
}
?>