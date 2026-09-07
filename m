Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E242D472547
	for <spacemit@lists.linux.dev>; Mon,  7 Sep 2026 13:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786580; cv=none; b=HBkrbXjll8mpqOc9csBuoXVlqRuv5PFD7EiGZHP0G8SnKVKBkOG1D2NA26l5CogPJ//3HEyMbIpPqTIUnKoBAZr6sMrzs8agk1tDbIEWYLM7d9PzOu+dvQeBA8kxstYzTvjN6iA6Ww1MAgRxNn5cZ9uqub6LqKdj1YcZCfoBgDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786580; c=relaxed/simple;
	bh=/o9/t0rmsd+fDXAPn0EGWSuuwiBMQU0cSgC7TC+ItGs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 In-Reply-To:References; b=l99yTFtra6RYlI0YZL1opgyf/Tmp3utT+Hp08ZsQCfr92oinyEJX30EvwhnrjL/+5IqCVRq87fikb1T4cSNKyOee8yLYC0rk6hxDKqJKB378ps9EkNMWbUj1Kql0jpbR6Wcd8I251Clkhkd7WAjFWmAa5NFaD+F+d2jYDhqkjz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=l3mgh9Fw; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="l3mgh9Fw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788786517;
	bh=pfKIQsbo9vF3XKUv7eH674e4/SPUP9mmFk38JxN5/+E=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=l3mgh9FwALlTah5zOJpypOJ3uMMBBc8FN0PS6a/mERDu8FSLvDif7/c+QSWEuwEq7
	 +c9gRjyECkiHC/wdfTOUHUQnIVWUE75zZYR8iREMZIkNbEa8VzBixx7tIRJvgpa2R0
	 p0F5ty2IDMyzVMyJIEhso6rIxvhj5ud7qExirEKs=
X-QQ-mid: zesmtpgz9t1788786514t356b3c3e
X-QQ-Originating-IP: 4bNg8jVrPAYnd+pOgZsuQP2LrmvmE3yfNAvXm2ENHLQ=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Sep 2026 21:08:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11280198482771072461
EX-QQ-RecipientCnt: 41
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=650bf3549e64181e01b13e7f3b0c8c6526d5423fd2d0620ee7d870eb7180;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 07 Sep 2026 21:08:28 +0800
Message-Id: <DL93W9G65JL4.SW643T11BP8O@linux.spacemit.com>
Cc: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, "Yixun Lan" <dlan@gentoo.org>, "Longbin Li"
 <looong.bin@gmail.com>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v5 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit
 K3 PCIe host controller
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Inochi Amaoto" <inochiama@gmail.com>, "Jingoo Han"
 <jingoohan1@gmail.com>, "Manivannan Sadhasivam" <mani@kernel.org>, "Lorenzo
 Pieralisi" <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Frank Li"
 <Frank.Li@nxp.com>, "Niklas Cassel" <cassel@kernel.org>, "Sherry Sun"
 <sherry.sun@nxp.com>, "Arnd Bergmann" <arnd@arndb.de>, "Christian Bruel"
 <christian.bruel@foss.st.com>, "Krishna Chaitanya Chundru"
 <krishna.chundru@oss.qualcomm.com>, "Senchuan Zhang"
 <zhangsenchuan@eswincomputing.com>, "Alex Elder" <elder@riscstar.com>,
 "Xincheng Zhang" <zhangxincheng@ultrarisc.com>, "Randolph Lin"
 <randolph@andestech.com>, "Siddharth Vadapalli" <s-vadapalli@ti.com>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, "Vidya Sagar"
 <vidyas@nvidia.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Danilo
 Krummrich" <dakr@kernel.org>,
 =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
 <u.kleine-koenig@baylibre.com>, "Pengpeng Hou" <pengpeng@iscas.ac.cn>,
 "Anirudh Srinivasan" <asrinivasan@oss.tenstorrent.com>, "Gustavo Pimentel"
 <gustavo.pimentel@synopsys.com>
In-Reply-To: <20260907112606.465778-6-inochiama@gmail.com>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-6-inochiama@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NvGGTAUhB2iWm6NZj9bABJ+Va+uyOzqPM5z3aL51H1Z4j3ywT/TNefLq
	zOSF99B910FuhjbQz4VAPA4zefQJPFkD6S6QGsANwJcCGn+TKP4d62WxPwFuKRZ35FGmiMR
	TC51OSPygT/wJySujZEZy/AD2XLJLLhihNcKxpXgDsNLoAWUoxtz66MaFbIe8as8PZ2dLIb
	8SI+onIiLUHrg6L1Svn/Ppa/kxzVLhXUXdfeKUToTHKOIPgkSfv6gjkgnKuqoMezORwahcH
	pL97M7v3mtiiMYKllZ78v6SYsUv3+Hum4NSQz9M3CIHnAn8xJERSnQpQ0E50sKbLjfRl0aH
	7T5GhG5Lw3upvsVCHDTEoqHVWoGpv/ZOMnQds9fxXiU2e87h/ddffT+FlnFrAXbefQJ/GOc
	C1DcaKoImGiLyHIJV8iYXtsTHBGfOXykvzqxJPbswfm59KktUYMYjKfkvu7ly/LgI/MEKrm
	qz3cdm/dUeHagkTlDiEm9PM+3aITfKrjd82UP6+yGKepIRbiNH0tOs2mp10LuECNpSRltb1
	Ze3gM19qcHzvVEXyQmkys+9D5dGlXSMiGwdQbW5VBaTbtmk93QSv3by95BqrkmcXU4TgNGc
	PBoFmiFDaR5lcI/jmzBK01qrCIsySvrYhdXGd4NbVmKpkJO7H56MfoTLpBDJroOPZT5RdcU
	/vkKVKenVBYWh9gPRi9x0unKALIpb+sceP6l70gHdcDlPZskzJMG2kO/epfSfmpCZb4KfIo
	Q9V5rY4PuRMr89toEjTNhh5tK81g+0NGHHpfjL+MoRgIiqvfxOOZrv+g4tiLywuOPvpiGFD
	4s+N5nGdMwPvr4F9UdyRMWOjjg9tkSU2rTYL44z4+1IviZnDKXIrRdSneDG04KS44uU2fIs
	ZwAOVGMzLs07nL5wXR7wi1yz3DU81VVK+S1wmnuzCyhwy3/xopB4W0FPQvaABE48Ygc31Rq
	Xjb5mOzTK3so06or+8PFA24WKBhJHLGxQjBteRdbpqnp/6Yr2/VBK733k2Vz7TFgoWt3ZgB
	VBhBUgNF+xLHZrUZYCSN/E0vAWMx+kF/xE3AHJwwmkjuFpabuX8jXJI6OVvSWPuld4EJjgY
	jXp0nBtOLsLnwqKaUzgP2k=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

--650bf3549e64181e01b13e7f3b0c8c6526d5423fd2d0620ee7d870eb7180
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 7, 2026 at 07:26:04PM +0800, Inochi Amaoto wrote:
> @@ -14,26 +14,29 @@ description: >
>    PCIe IP.  The controller uses the DesignWare built-in MSI interrupt
>    controller, and supports 256 MSIs.
> =20
> -allOf:
> -  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> -
>  properties:
>    compatible:
> -    const: spacemit,k1-pcie
> +    enum:
> +      - spacemit,k1-pcie
> +      - spacemit,k3-pcie
> =20

Please update the title and description to cover K3 as well. They still des=
cribe
only K1.

                                            - Troy

--650bf3549e64181e01b13e7f3b0c8c6526d5423fd2d0620ee7d870eb7180
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCap63TA0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvrqIBAPoJ1V5DULfRR0iJ/PbsZQSGaU27Bg5bTx8RdSGL
sdFIAQCo20UN07hYGkyKe/hWeA2JzbRW4qEfBzGFoFaMdr/IAw==
=WCkQ
-----END PGP SIGNATURE-----

--650bf3549e64181e01b13e7f3b0c8c6526d5423fd2d0620ee7d870eb7180--
