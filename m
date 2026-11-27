Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759880;
	b=OFjsBUzUxYXxEjJ9e0Rfohlmpw/T9B/7Fb3+AM7Hv9v6oorO3uDhjIzy2St13FnKRMAU
	 7mUu+KLzW57fwkgoEik8FOoKw30VNGMAowhaL6lG4UGtr0pL5XvRG18coTnU8fxKkvJ+K
	 zoZpGDlHCeBuX53vaVPX+eiZu+ttlOWfFyar6u7lY9SrrvntZADdl+yWO78yHcJkshMO5
	 5QvAO5NVP4OFpG+4dofUUL3RkbuIAfjeOvPZnPHVVVNYK6NWAd47uNashcDYzrh/UZvJ0
	 crt82WTEusXZ7IjVmoDD74VHxR03bV2puWbNP53JghODx6NTy6HcGcTWRdZcAFFOpgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759880;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=E2NeSLXfonrxSY+W49lO191CRD3CyOzI7hF6dMSOWd8=;
	b=YQ8g0qXW7J8QIaxab0qVWoZWW2uujg6U/L/oCuXGlhv3lN2nFqTMZHyyL81WYN+ecPlI
	 hTPNxVVF5YyEagXyzI+7cHCNKdDzJ58KpMe9jFk9EinjypMFM9yKqDbE2xEaL4NfU7+AZ
	 MUY8K6cruK9eV9A7ck3ZzYThVR2D+LrEYshKpsawB7KcWdwtdRpYG3jstIQ3whyZkI1tw
	 06xFUmprCyfYRp/FtJrRrVzleN9UHefG3zf1LMiKaFb4gkN2feoC0tLeR99n1vvCFvcCX
	 XWPy6BfhMN2PYIoQz7+K2PLpftKXH5aeKcORnUazy3HihwkAnfxT2OetzaV2CDPIxpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=IlGuBUNf;
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5EF606A31C
	for <spacemit@lists.linux.dev>; Fri, 27 Nov 2026 06:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D5EF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=IlGuBUNf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795759815;
	bh=E2NeSLXfonrxSY+W49lO191CRD3CyOzI7hF6dMSOWd8=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=IlGuBUNfuc0X+Pt3hn9np8itQgtiT5Y6SrDdfdiN0lIRUOz21aPe8g8Qgadna6M75
	 bdn2tXw/j7r0us/0BtOSVxF1Yjyjb3TUWZxP8XiPP5Q5qt8PZW/QpXEI/b84/aI1Ze
	 6Lxe3kwqdBXOal+B4RzUZg3Lpsm30yimKVcfbLH0=
X-QQ-mid: zesmtpsz4t1795759813ta86aa600
X-QQ-Originating-IP: n4795X9CtarIxKcBmI9iCqupaEOTuiKZlULc3AJEdYw=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 14:10:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10182266507146119862
EX-QQ-RecipientCnt: 13
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
 boundary=26ed1f322d44d2ecd4a6afc050eef67eafba067d32d916536e0aeaac7c68;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 27 Nov 2026 06:10:10 +0000
Message-Id: <DN5RQ489MNYL.1WRXDMIRHZK6I@linux.spacemit.com>
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] riscv: dts: spacemit: k3: Set CD pin bias
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
 <20261125-09-k3-dt-minor-misc-v1-4-dd887a8eb326@kernel.org>
In-Reply-To: <20261125-09-k3-dt-minor-misc-v1-4-dd887a8eb326@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NPhALGoAJPM8bVLOJNUsgGmOkOFiqtOOUiYoxC1L7S/MM+r05SX1ibCk
	OqEELwN5YBBcDCEO7ca6rd7uE6Vd0D/gC5037rOeHXSprOKLHZ8T59gqLkNh86U46aZftoX
	wnhAgezQTtL3/z5PdXu3H9zMsKXOPb79IxZYb4foYQqCc5Ifl2k7thsqrjgn8ydYt4DlwCl
	2K5PaLsBigw6EGrCapVzC6vuu7p2yMmvoRiBoI9FffzjQ2C7yEaOYAJry8hic1hRVqC1PKd
	YgigMFcVvG96f4XANSW1oSYAeopAEGhcCQesHait+RPFeLAMwaYZp3H+HJnU5dls1H6G8vg
	ZOpb1SKlg7dLZzS1n4wp+aGmh3P/C3t1njiWwuYgo7fFbybtc8Xuj24+v1yFy6HDdBPtGwn
	rDRkYOsi//WoozCmpn9eJmpLK0lZJn/DCNaayxXfBNLEb8NVFF33tC8xCpeoomP507I1dLj
	nkgFITt4684hsdYsUO67+yFdlas9eYD0iHCyy6zYfopYAlbTK3pCRbUEVZkjD8PTDVZlpvJ
	phy14aEOlRgdIJznuRSPUWC2cmGfEDpsa6t0S7lQElfP+TKeO9D3ysVGPeliBTFtqscMwJi
	2F0s1cOl1j1OgaaqGpG2c07jyan+LtWxl3zFijxSuHWpWVE1kmuj6g84/nKIqGlAgSSCNug
	zsKaNzBhXw1AusWEgqm4P5zv/klTY2KC6yazXDQVfynhTLHKDnNKl7AM3OOUhYi0B7kOLIh
	ezuwXXJRQlMRdeLikkyJjWQ3GWen26qQkEE9C5qI/Lny/Ws+FT98h/fBTKFUzP5WRhHjOKy
	2aLAUUN8zk+sj+xmKf5VIJZGfqJjIhAfeKfPDbhGUHdcuTs91P1jrDATXjyf+i+DRQOfW5J
	Ge01M8ILw4PSvy6e0c6as8Lrs22ugr0ilA2qMDykCNTiCime+VCwmueLz+bjZtPvM2L+aX/
	yEhxFjOo89yS95Zzl9z05EZ5uY5nlnOZSaA3+PXwZ0kdltB8gWPRwTTFi/126NdU536M3DM
	+OjmxnbD2wZSVjm64XyBnsRno6HIHzL9j/CbL89tDUAmVdheiL7XdwdReXxY7I40nEU2gbL
	cg2um7Vyisvmr0//pvf7+YwPemzkiK07Igjot1NGi4SwqcxZRykkpY=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

--26ed1f322d44d2ecd4a6afc050eef67eafba067d32d916536e0aeaac7c68
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 25, 2026 at 7:46 AM GMT, Yixun Lan wrote:
> Explicitly configure the bias settings of the CD (Card Detect) pin
> for MicroSD card in CoM260-IFX board.
>
> During the GPIO pin request phase, the pinctrl driver disables bias
> settings in function spacemit_request_gpio(), this happens to work
> in kernel side, but doesn't for U-Boot. Adding a flag to fix this.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
>
> ---
> K3 Use same SD card slot as K1's MusePi-PRO, which needs PULL_UP.
> ---
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boo=
t/dts/spacemit/k3-com260.dtsi
> index 65c6f49f8591..598a53461afc 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> @@ -240,7 +240,7 @@ &sdhci0 {
>  	pinctrl-0 =3D <&mmc1_cfg>;
>  	pinctrl-1 =3D <&mmc1_uhs_cfg>;
>  	bus-width =3D <4>;
> -	cd-gpios =3D <&gpio K3_GPIO(4) GPIO_ACTIVE_HIGH>;
> +	cd-gpios =3D <&gpio K3_GPIO(4) (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--26ed1f322d44d2ecd4a6afc050eef67eafba067d32d916536e0aeaac7c68
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCawkewiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/aXQEA1ljwDzb2fdP6
XzncsQ9ip4r67ZDtHNdpKwFVYpXsXskBAJwpqVE+V9wjlbhp5FQodbaCyQVw4YuI
iJup+srjnbgK
=BeSR
-----END PGP SIGNATURE-----

--26ed1f322d44d2ecd4a6afc050eef67eafba067d32d916536e0aeaac7c68--
