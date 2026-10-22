Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792639191;
	b=C7x0jZjtzPcqHD/9njSvXtSr085ByaJuA+mDcifzC27PaP3s7Qrs7TindtEqY/FRo4uE
	 wnWi2x/c1a8CNw+3sSab28FnAdXsnckyJ/2eA8wOC7rhy3rM8bHor7xizioT2tyLoehlQ
	 F/Ti86QF05Hak0BsEGI54hIbsOsvFVxz0vPYcDmFlaueUarHlNpST2b5GtVfgpVrGvSZb
	 Y9EKHFtNgK5SdInnvg+VBt5ICVv2Fwx1NipGqvG0OnrU2WDxmWrKV4l7o9KONov15D9C1
	 cQJNeJ24xstUqgKFcf2BsfMBrMHzWbQITYyTU0Dpojh5X9zZtUr9O/7J4feyHLasNxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792639191;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:X-Mailer:References:
	 In-Reply-To:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=/JUTPTDl3DvoEWfToW36E2HDw8Rwl5aay5g6qHBleZg=;
	b=lSLo64Nzq22QTdKMMZSdYypIh0YnG1nVTWEWZ562Ln7x/uwAaKd1Jn1Yu4JN083s8rT8
	 TyQKP2SnIpnW0PcNTG6exLUWoTv2zIQ4QkTzQiD5bMGyzNUK6c7D9jA1hhItKUHy19WQA
	 bJVe+NMw31AzR3cutCLvm7Ixhc3WoDuMJwrkDCuFWIhV8uCK/wvdrPTPbx8rq9tbZ8fpD
	 K2yQJwxTxFX3i10j0uvuPw7fe4UqSTo2chskeOlzRTj7HYBJM8iJBtZNJpLJggOUkeK2U
	 R/YvpvLnCEDa1Ewfmajiv3qZtnQ3Qigr71QejYzPbbfW0tbPoNTBmcuw9oZ1BrZ0E2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=K3RTbP3D;
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CA0606A324
	for <spacemit@lists.linux.dev>; Thu, 22 Oct 2026 03:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27CA0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=K3RTbP3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792639125;
	bh=/JUTPTDl3DvoEWfToW36E2HDw8Rwl5aay5g6qHBleZg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=K3RTbP3Dm/Q3Rza4/lthR/aT2EctP713zqvnPliF61BdUkqDZ41G5jvFU8XGPNFOE
	 celuf1OoYn4AdldWov5SzOtb2PpKE9qb85yyP6biAqZGstMPtLiC9Ycsi8yemFP6xk
	 uC4/i5CftAO4pG6LW8jds7wZ3GlhuuT1pguIU6cA=
X-QQ-mid: esmtpgz16t1792639123tafb198f4
X-QQ-Originating-IP: ICPxySEftKnBISmNiBeiOIrTueBfjfFOrGVxa1s5a28=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 22 Oct 2026 11:18:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6102986534664089495
EX-QQ-RecipientCnt: 14
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
 boundary=31cfa6b4a87c9db47b94322de7283a792c5e939a3d8a2a05e0f0c1fefef7;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 22 Oct 2026 11:18:38 +0800
Message-Id: <DMB1J6C0UYAM.SN46HDB4HISY@linux.spacemit.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261020081633.3673704-1-sandie.cao@deepcomputing.io>
 <20261020082015.3673761-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20261020082015.3673761-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MesT5uKpDagV05sbWBvphgIIaUqm9aAcHXKrfqA+ewpXGHniyYVPU/Jj
	DVSj2DkPBFVbUBbo7bi1CAaREaMHOVe+WaPgrIU5Uj5NkyAnQ18jFd7tRU+/M1MQ3kN6zPl
	+nHfbp9Sr7YwvG6vYWQGtKZ9OQzhG8l6OnySOPk319To75+wTVGhKHSgYTJDzy7Ur3TxpvO
	qXXmAaZOIqVFu3NtdG7Bg/9vb0zkbGRsEUf7mA1KTUYYqFw3VjjxsiMi4mjKNYw7h3tK6mA
	k/hnsXbyHrsoV8C3EQu7JF9JwQ3Qm0j4L2WfDfJViPZZC9I7NztQ7hElfRQM1T9VCcJwqwi
	7erHQNHrQM2soOzq5YDF054IANw0/APucgMcZBuqeYKEz9rUnsn2wLbjBzCVizeU3GLscny
	7oLy2CcoXw43kKLGDcVXBm3TqT0L3Ij8X6/RLYVHYOCGqmACmlqGb9AWG5e9EWmfOcwC5st
	BKE9/+MLkBCsLBHM7iHl7f4AtsKHBSSwd1p/d4YTbNBsgIMLCYZcsiR2cPuvQh5aGHrqLGY
	jbAvLahLhOrVEaNtNrfvCq1UF62aFy/F2/pGj6XWZrmAFp0mYOvYQU3JMVSW5axM4CevU9U
	0DEWxwB8iagYD/Edd5d65PKLEHGTL2UgPoTGLDrun4sBzPPBG0DwXF2ogqKKqURWH1FCc22
	0rmUjnONgreGHAqV5uRgmNH0YnUmG5iGfZoWy3TiLkOMOZw/5ZHrdF45DmYxNJTlXcJ2Vte
	0kPR9nqJZh5iGWBMTqYFK4C2jomtKqkvJ4PcPeedztAbW3fLKgNRjw6t8ew0g2cGLEAFY94
	pt9DKEPPVZp83tBD1oZG5Kj79NabqMfE7fL+kBhPHFzSPFGLSHEXOtqgMQrrsbhWt3cZblk
	6sCoza4rjr6yVS6rIZ2koAdNIm8kz+Il6qcv23wW7fDz/mNKxCVIcTr9EkvL0dMaf2nPP2R
	kxvKTB2vu9xFymHW/hOkaQzQZmoE/f0ENr+EWJJw4z/j9duIj/b2O0zpq6Gr/lfz1/3BfP3
	nonQx1yXZdbqSqStx5UEkgfPs/pzxievFDzWMRc/i67WWDntChTCcdnsLVNURDur2WLtDVP
	aiGtaKLO8lU5zrPITueprjZxsW/ajcVmOHrLrjG+ciS
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

--31cfa6b4a87c9db47b94322de7283a792c5e939a3d8a2a05e0f0c1fefef7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Oct 20, 2026 at 4:20 PM +08, Sandie Cao wrote:
> Add the device tree node SDHCI-0 controller for Micro SD card slot.
>
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> ---
>  .../dts/spacemit/k3-deepcomputing-fml13v05.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b=
/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> index 84f66dd8f962..09e3d46a2ea3 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (C) 2026 DeepComputing (HK) Limited
>   */
> +#include <dt-bindings/gpio/gpio.h>

This header is no longer needed now that cd-gpios has been removed.

> =20
>  #include "k3.dtsi"
>  #include "k3-pinctrl.dtsi"
> @@ -184,6 +185,23 @@ &combophy {
>  	status =3D "okay";
>  };
> =20
> +&sdhci0 {
> +	pinctrl-names =3D "default","uhs";
> +	pinctrl-0 =3D <&mmc1_cfg>;
> +	pinctrl-1 =3D <&mmc1_uhs_cfg>;
> +	bus-width =3D <4>;
> +	non-removable;

Could we add a comment explaining why the SD card is marked as
non-removable?


--=20
Troy Mitchell


--31cfa6b4a87c9db47b94322de7283a792c5e939a3d8a2a05e0f0c1fefef7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCatmAjwAKCRCYCe+A+TM0
L8C8AP9Irgawm5YpoIAUfeaOEmpkeMyleK+xG8EFI61rJSKlOAEA6/HVKU2fHd7+
uPDtKcTGGCeydx5BiDR2GfdRfcLrGAk=
=qRux
-----END PGP SIGNATURE-----

--31cfa6b4a87c9db47b94322de7283a792c5e939a3d8a2a05e0f0c1fefef7--
