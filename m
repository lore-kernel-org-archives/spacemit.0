Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682F341D10A
	for <spacemit@lists.linux.dev>; Tue, 22 Sep 2026 08:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067416; cv=none; b=IHNxnVBXd5dWicmyImUtNo6rPpqxKw2M6yvVW0EJvEDQTOyunQeW5cdvcxiy7DDzgakA7A7qEHgk0NUOkCJT2DUIm3v95IOrqs8xof+pTxyxmKjOd5vvDi8De2k7w2j+Dp/TPjF6wkP2byjbNv6m4bV40Wugdm1wWa1Ywvfkp9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067416; c=relaxed/simple;
	bh=oPeQ3XLuUKXRQWHXo4tXeoia+BrsKnr/qmeznl2LFN4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 In-Reply-To:References; b=Ng0/eIt5IAFdFX4CyAxa+biXP0y6R36PDe6NrdmIVSI9AuC/DHCW4IqYcid+al2YkaVYK6UGczF5cl6IJvRwJi/FelWlo5leB2crn2oLp65CygiHIguBa5qAo/9bjT8DYFM+Un+szae33dULnZ3UpEk8ZayQ2TqUV2t7Yq5DlKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=QuAio5tW; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="QuAio5tW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790067344;
	bh=QJyVwtKSewGzHI+ReObmC25SE/N8bNoOAYhfVLfu9jE=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=QuAio5tWBhg+BdgaEvpzXWtWYbNDIr5FEnoloENdWghduZWQ7S0CaL0WkBn+PAWn7
	 qZAaSqS4SYIFw8GGiutUP2wQ9b2ziCunrPuW+uvx9R0LKUBJedEZmckB368D95OzJ2
	 0wwpHBiKHlcCNHhSP6M0UpAT/ybc0OtjPhsrQPvY=
X-QQ-mid: zesmtpsz7t1790067342tf3de2c6d
X-QQ-Originating-IP: S9iYn0j528t5SWdRrrbA6iz1oreq6FD1VOr214a9x/Q=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Sep 2026 16:55:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7129964714333372295
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=d72ad57d5253791581f049dab24561afb713182c6bd228dc2826c5d750c3;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 22 Sep 2026 16:55:38 +0800
Message-Id: <DLLPWUHF8WRQ.13YQTP32MG59Z@linux.spacemit.com>
Cc: "Rob Herring" <robh@kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Conor Dooley"
 <conor+dt@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <spacemit@lists.linux.dev>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for
 OrangePi
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Chukun Pan" <amadeus@jmu.edu.cn>, "Yixun Lan" <dlan@kernel.org>
In-Reply-To: <20260920100000.3888256-1-amadeus@jmu.edu.cn>
References: <20260920100000.3888256-1-amadeus@jmu.edu.cn>
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OLsBWtCIHsg67aCHmB71aP9d79zNRwdmEAh/x94A3a6Tp7GCgtnNVY/a
	GGy94m5i7wEBa+PI2kF5jtaPgma3Jw9T9v6RE672gzfaSmMcPBjhG+ahf036ookhbHoPH6h
	M0aqlA/ksa1TatfS+t6PpBV73oxXdJFX9I6L5cwAEknxmHlEP16u3nFrNVDZIZy7UMMN6IV
	CQlDyrHbzvTrFuKQ+FlTys5QX55dYSNT3lLbOAcaOVy+P9dyGfOYKDCDOJP+ggSLCiIJmK1
	3WtnY5T5P0zDSdDUJmCRGKRci22G7ehtrQPCLZS8Ll2j/qjuV/vR8fpQrFk4OhsVk3EvuI6
	UfQnBqjcQkQCxu9cRgHBtkBoFohi4a7aM7XggccvchvwswfpJh8quzPo3xqukXAMgwLalDX
	EquMofPWnaAQd0hjmXUd+nW1Ya6+kFhfwclcBRJTfxgylszQIakHNYOH1KyZEGcb46Ys0pU
	0Vog4d3XvBJ8QV8NiCrRXxkqcfalbZMHSl3nXquX+rTQY3vVYVXMpwamwb0kmUWaIugcN3r
	MuagT5K+a84lBi6UvesMrszu4ylJBtkeyLPcV765VijNKFenvO5FEJ3GMYEtS9BV6POULCv
	SNHeH1aVA5TD49KqZ1VwioPg2eRgXgmkXFZHjdobWua5XFZL/WqB2te28YZ1vaqElgyXHWp
	cG1rebj2mO/V8Rj2lwGcZDM1B0n8hmJ5smij2wHUBHIRj6H5I4hGZKSQDaAsGGkCyzZt/oj
	6BgzVg7HVV3M4zMgTmV2Ehji7tlRRwMWexziYDCoVzry1ykOY0y6trqmG96OsFfsDCMGWLw
	Km9B1T87smOjGLNde1ysH6pE/L0Lljzk+gpvrbA/At0q33EDNeaIQ3l1n8IWEP2dG//v65U
	I2v9wlxjVooROD9Z0Cy1zwt5m+A4/sCatNuigThgclt4Vg5Fv5tPH2KMW1wRnqERdJuWEJi
	/jTN4g/ZCIWuzAq0Zj8Crc2fN4AT+OdhBijtxgS9b2NIoeQCRpsd7/+16g5uAteVHkXzm9q
	4MrQW5bm8zZyaIRPZxF9sFDy81bwQ3Zi9kklffADEQzsgtCf6EMvY4uPLGZ6OScKvVL9OEE
	A==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

--d72ad57d5253791581f049dab24561afb713182c6bd228dc2826c5d750c3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun, Sep 20, 2026 at 06:00:00PM +0800, Chukun Pan wrote:
> The EEPROM on the OrangePi R2S and OrangePi RV2 stores the MAC address.
> Assign it to Ethernet, with eth1 having a MAC offset of 1. Remove the
> Ethernet alias to avoid U-Boot patching incorrect MAC addresses.
>
> [...]
>
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> @@ -16,8 +16,6 @@ aliases {
>  		i2c2 =3D &i2c2;
>  		i2c8 =3D &i2c8;
>  		serial0 =3D &uart0;
> -		ethernet0 =3D &eth0;
> -		ethernet1 =3D &eth1;
>  	};
> =20
>  	chosen {

Where do the incorrect MAC addresses come from? Linux prefers a valid
DT MAC over NVMEM, allowing a bootloader override. Could we keep the
aliases? Removing them also prevents intentional ethaddr/eth1addr
overrides.

> @@ -66,6 +64,8 @@ &emmc {
>  };
> =20
>  &eth0 {
> +	nvmem-cells =3D <&mac_address 0>;
> +	nvmem-cell-names =3D "mac-address";
>  	phy-handle =3D <&rgmii0>;
>  	phy-mode =3D "rgmii-id";
>  	pinctrl-names =3D "default";
> @@ -90,6 +90,8 @@ rgmii0: phy@1 {
>  };
> =20
>  &eth1 {
> +	nvmem-cells =3D <&mac_address 1>;
> +	nvmem-cell-names =3D "mac-address";
>  	phy-handle =3D <&rgmii1>;
>  	phy-mode =3D "rgmii-id";
>  	pinctrl-names =3D "default";
> @@ -129,7 +131,7 @@ eeprom@50 {
>  		nvmem-layout {
>  			compatible =3D "onie,tlv-layout";
> =20
> -			mac-address {
> +			mac_address: mac-address {
>  				#nvmem-cell-cells =3D <1>;
>  			};
> =20

Have you tested with AT24 and ONIE TLV built as modules, including
network-root boot? Without a bootloader-provided MAC, Ethernet probe
may defer until these dependencies are available.

--=20
Troy Mitchell

--d72ad57d5253791581f049dab24561afb713182c6bd228dc2826c5d750c3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarJCig0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv2U8BAJ9HtLWnl55CiMGdaDRYSZReiOVteADUBzeJJoQK
JuYEAQCgs2kWGxqs5Ilk5rGt22lx7egm/u1lHicDhhiCJ7SiAQ==
=TcPt
-----END PGP SIGNATURE-----

--d72ad57d5253791581f049dab24561afb713182c6bd228dc2826c5d750c3--
