Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795482049;
	b=cW3cI3REm3Rfc4BGCm1q6ZtoNBx98+kTouEliywQZOTnNVFTSiw6gNJVk6h2RcEmeVVU
	 AkeEKhQYuN91EFOqIo6HCcjKM1yAPiqpZjuBw/SfqT4KbeBrhl5PG+o4xgBjz5Hr3fFZY
	 lTADnQyjfAT1HG9vBBg2vTzzF+i9Ym9+rT1s2YAQNUO1thzwPl6QTcXcsbNX6uqMg6CSx
	 W8Q0XTCTtZzr/L8lXcdm7/StzPWCXPtCBNhPVKcBu+3ZKG1GED0yzgLf08Yg5oMWygUT/
	 Ik8mPhY6qhoWlQIn8osmUekT9wjQw0zV2fwp1gJzGrFwDjLLQyqkQeauWP0NBu68lWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795482049;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=Ggw7YcUYncqyVJG+//d0uJLUqpnx7zsMywIoX1umATo=;
	b=LnRumEDI9FApPqehr3yvnwIbktkXjRJEuX60fws4Txo8uCO3/seN4ZUSs6g49yJAccAT
	 N7yBVR+6ZyyFpEkOyDNdgaOLfeNCzl9viTxOiDnhnbqJ1W1S6Z5bxBQfT6uBWHOXJdTPI
	 RvgDEwBq1/Dk4ZRNZJoxFUS/vJH3evjowHzD8PQUpNWliPhjKbPK2RQJ2Vyl6idFMlPT0
	 2LkOd0cvSyi/zlgzE5+G2z0nXx7iKJ8qYR8pVM2yBzpHYaCmf3U7ElHNZo1VAiogGwdTp
	 jy0tgbhNzdSuhIXj7hRUfPWhDHJbdHCjNA9GJvwRM1jwIQEG9WsTZOuOdyfVi5q+ohQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=QlM6IKAC;
	arc=none smtp.remote-ip=54.254.200.128
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2116B606A31E
	for <spacemit@lists.linux.dev>; Tue, 24 Nov 2026 01:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2116B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=QlM6IKAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795482027;
	bh=Ggw7YcUYncqyVJG+//d0uJLUqpnx7zsMywIoX1umATo=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=QlM6IKAC38SvCbK00Pi9cTE69gcAUBd3lHR8uGTmD1Vaw+VGVYl67gpmUJJgPkkJz
	 9bKl+H4chJIAmv9DpE9a2lud3OUn7u1oM/yFw+f7TIstdNGNFWLnlSDuedEh2AZHHf
	 Udb0bdmtUIhsSgJYVvFhFZfYHDu2JXLoUbJwUlMk=
X-QQ-mid: esmtpsz16t1795482022ted70460e
X-QQ-Originating-IP: aaGmqngVMZGJB+SVmvOQbimTL7t13n7UZqIKKuEE44Y=
Received: from = ( [183.48.244.245])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Nov 2026 09:00:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2033590560538473759
EX-QQ-RecipientCnt: 17
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=717a22241ebf390108ca063a911934bd69b0b5ad107928f9f178dc29d784;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 24 Nov 2026 01:00:18 +0000
Message-Id: <DN3198CCQBG1.RZR764NVW5ZK@linux.spacemit.com>
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Zixian Zeng" <sycamoremoon376@gmail.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Aurelien
 Jarno" <aurelien@aurel32.net>, "Vivian Wang" <wangruikang@iscas.ac.cn>,
 "Junhui Liu" <junhui.liu@pigmoral.tech>, "Michael Opdenacker"
 <michael.opdenacker@rootcommit.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
In-Reply-To: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OGmpL5CFYt/YATdBNWYWGhBWqnqjud8jL7fKHkPClwCAn5dG/yjBkOKm
	VxABQ9X79QymsaamZV/E5YxIyDm8KoGFoTGKeFcVS9aqz3rMBe0EgilRrgZVKCMfnHnRGxN
	MIwysIvUN7NoGG95e9Qv4drW2pxXgD0HgO4sUnw5d9aWUWbqZDbIgsvV4t58C70e/r3Gm6q
	EJ4vc2deEMBEnfhtXgxxxsMTbWXMh5Wnpyns56CunymkkdreUHpQvpaOTij82HG656MJkLF
	xNDHBS0PNgIEoGkMdRx96XGqQ/Co9jhLQAxnvn4JEAoU6aGF3CjgjO3G1vkhTB1J+4JCRRx
	WhEFNWJOqpEqFXY5GxmWke/dsTyciptPB7iI0F7Gaz0pia8pddK1Cm6zRy6699aOpYYbOYZ
	QvqflRlJrtFNixOBQ3quI6LbZCnUzDVwGNCNAHTbrVKFGqGaM2wYMQaRU+R2lYbPlcGMy35
	EVLEwYYhBvCvGHuNsdmDjqzefZbiDFZ8Ii/yZp/beo6nrvQIhn4GAWedYM0qPgwGfB4QOC3
	DM7oxSdZRd7sEFCu4wRbWqmKjVh3Kt3gvWL4FGxxH3fKbDlj2QQAtTgpZlRD0a5tFQtTrqN
	g/YNJFs3EWmg/mWo7btM1bvTimd53UMpzHcYOBJW+5elLSJUf/K+wgjUh/WMcU2leehtH2b
	gwDjDBvho9UNG9F6aeU4pV26xd+NFlp32FB2t7Ht5Nh3rslk0zy3HxsFssVlLS3s7e5keoF
	GBP3bNFnHIUdb6QMtDWiCdy2bCW+bfBw9Ow1oRpBPfsLeLU6Nu+Wp9uRHXGCWisG36qAgmO
	dvGJ09VZO7HJcHqpFLqYEf1zSIy3pJMLLBSuIgUvXCglOm05dZ8bp4euKL3/pOoNC+6kLkj
	R6kcfDFOylj2TDjyYBR3fzMmRQ1vzsfi9wfncyH6qYi9LzXOzQaxE3GLp3RYA5DQv0KKMUY
	Q1rFk4gXwV1BW72/QLCtGdnQRmkQGjhHF7SsgUTU30eQztIgSgSDeT/xo9Q26DFRGxlpNGT
	qOWDLT7b8ugpX3Qyas7OV/pQ4pfi3MvtXcPz0IK33nfZFv8wcO8QZal7arZkVJMz4QxcnWz
	kx7CrH++MuRIM0xfTUM3aDJPKT6QtRm2IdICwpUGsQtx6B8aGsRzm/uZ/q57z9Q8jtd2abw
	XQA++sCEZ7pogNg=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

--717a22241ebf390108ca063a911934bd69b0b5ad107928f9f178dc29d784
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 23, 2026 at 4:41 AM GMT, Zixian Zeng wrote:
> The bananapi-f3 carries an AT24C02 compatible EEPROM GT24C02B [1]:
> 256 bytes with an 8-byte write page, which can be found in schematic[2].
> The device tree declares pagesize =3D <16>, which does not match the
> eeprom chip datasheet which declares pagesize 8 bytes.
> EEPROM pagesize of k1-bananapi-cm6-io[3] and k1-orangepi-rv2[4] changed
> together, based on the chip model shown in the schematic diagram.
>
> The TLV EEPROM on this board holds the base MAC address and the MAC count=
,
> so a corrupted write leaves both Ethernet ports without a MAC address,
> which is how this was found.
>
> Link: https://www.giantec-semi.com/uploads/20230414/GT24C02B.pdf [1]
> Link: https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/v=
iew?usp=3Dsharing [2]
> Link: https://pan.baidu.com/s/13UTY_qM4gGuVxsZ9U7_Xpw?pwd=3D8888 [3]
> Link: https://drive.google.com/drive/folders/1pcI_U0C3VJKTCg8A1zj08CwNboh=
nONSR?usp=3Dsharing [4]
> Fixes: bfce75e2345f ("riscv: dts: spacemit: add 24c02 eeprom on BPI-F3")
> Fixes: 46a8c01700ac ("riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO =
board")
> Fixes: ac436e6879f5 ("riscv: dts: spacemit: enable onboard eeprom for Ora=
ngePi")
> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--717a22241ebf390108ca063a911934bd69b0b5ad107928f9f178dc29d784
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCawThoiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+o+wD+OlEf5HFUNy7f
l7HTzclNxt5QfKGOcZ77dQoUSqNlL8EA/Riqjg+f1nUhCjJ/zfcW9Ig33/Ral0U7
tEVGQLgIa8QB
=DIuQ
-----END PGP SIGNATURE-----

--717a22241ebf390108ca063a911934bd69b0b5ad107928f9f178dc29d784--
