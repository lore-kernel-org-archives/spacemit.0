Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801723;
	b=Pof0g8cnzGFw2wQBzYTumhmFQKV/SkpdZ17ytVsKAh14WrgTSMPTSY5utDEcQbOUIHcC
	 Oo8kuS9NRiakEN7/Y/qhRlJ8FFs2JAyRJri0owYq0lRF+72BQ36m11Ga1V+1BKvcCHFXH
	 rn1C5XusG/cd79e2xwC417aDDyHIX9MiROs9bz0s18Qfvs5GJqhI4xZgGCdZF1KOOGgfi
	 j3/HPfKY1pq30k1UC/TJwfVfgbpnkUfnjMu/6EH6OxqNXYubBxthRn+gs38LeYCqRD9hZ
	 Hu2uOjEOS4L3aJpRs84MFh3WB/AYqlz9rRCqa1CvsZYhe/03Xkmr6nuOJv/ERoPZQmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801723;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=YRFzX9U45u392R6CS3S9srqLygNa9Vb4srT2gSOpYyY=;
	b=KgznKAHYtqMFOD8ugXRaobyxcqP45dJfKDefHOTINiFZAOYfUcQkscvMNz+i5q1jJ8XW
	 z4DsL5VM5F7OfQT3RS+DFwP2GxNaQUiZkv4fQw5hfWfQ0um7PvS0zZF9cs1SSoEncZhUQ
	 gGgglAbqmAIWBmjVk08UjWkl852x/V/8hiYcUymI21GCpma0eUqIur+kz8hvFtJPBX6x1
	 caK/1+RyMec224XReuVOi6UQZ4+q564jjzqBObPbzD+17m+H9Mcft7ZOB7VmfwxwpdijU
	 mSliaIKvGYfABqbGmB0wV/TbRUkDjqHt59A9jV4KRSeuVXaLis5HGKvX80rxEtFIN8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=M9wjH8Ka;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E955606A335
	for <spacemit@lists.linux.dev>; Wed,  4 Nov 2026 14:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E955606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=M9wjH8Ka
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793801659;
	bh=YRFzX9U45u392R6CS3S9srqLygNa9Vb4srT2gSOpYyY=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=M9wjH8KaPJl5odAg4TcCw1vuqIexC9g/6N/vFvVvPwhIvmeQxBQ/8IM6inUzsRGh/
	 Sso9I9ilFIpK45stJzrONuEYLnouAQr3gmnY7H20RzfY5UIjtgvZJCRoZKe/JddQZ6
	 TRDtyb6sxqySu6IB/2cOXrNzll/2aowUxnGblGaA=
X-QQ-mid: zesmtpsz3t1793801657t27ae4659
X-QQ-Originating-IP: VHZFg6dY0HEn9gNaE2tnlCiu8hVYZVO1me2iozeib+M=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Nov 2026 22:14:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14208902309344038913
EX-QQ-RecipientCnt: 18
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
 boundary=781b55b6c1a4b8d869ac8afe61faab8498bc4cbf4cf36fd0c52106658e40;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 04 Nov 2026 14:14:14 +0000
Message-Id: <DMMHM7OIO97H.2SHNC575QC4PY@linux.spacemit.com>
Cc: "Rob Herring" <robh@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>, "Ping-Ke Shih"
 <pkshih@realtek.com>, "Anirudh Srinivasan"
 <asrinivasan@oss.tenstorrent.com>, "Alex Elder" <elder@riscstar.com>,
 "Vladimir Oltean" <vladimir.oltean@nxp.com>,
 =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
 <u.kleine-koenig@baylibre.com>, "Pengpeng Hou" <pengpeng@iscas.ac.cn>,
 "open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
 "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, "open
 list" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] PCI: spacemit: Ignore PERST# bit for controllers
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Ali Tariq" <alitariq45892@gmail.com>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, <linux-pci@vger.kernel.org>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261104140750.761330-1-alitariq45892@gmail.com>
In-Reply-To: <20261104140750.761330-1-alitariq45892@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M78R9KLJLU4Ir4N9hic/C7wRpgZUCL5hTYegqO3BeYHPW3EzDzHjPRwW
	xMQaIHM528usNPb4+olAHvN3OETVGBpmBVVqjIPGenlwYVcUy24m6XIgr4EPHGmxT4Z8/D2
	NgcNsUrY49J1S9X+lPYuU4/E5935VgAsT4fRN0SmizbDR/Mc6VszxuF9ov64sCewN+KXN1F
	RK1Rya9TqxJiDPvdhxs/ZMz8hIIAx/+fq3G0yoPxWYF4ElrSKQeS+jA6b7wETX/ftBMKAxh
	gnX4Q2NaAd5a1/tthsH3XevuCWBKywhYxd1BA3lLRiS8VKxHi6LHqxu0LdXavGQJjYpZlFh
	vElug5daMpouZknruAmKYMzfIA8HotiRoZ1miRjVa5TE+OQrXTdKIADkvii1sidOvo09GnX
	E3aGtLoxrOs3VC1Rlb80QojVWAV9mjvFnS1/tugVtfikqyJne2EAwJ0bnlP50Bgp42BUbyk
	QRB/GAgwh2IT2/+JG1jk88xltTz2rYDpBLaTqMGvn8PdzglmAgBiCpGkKeR0v6a2GJ85VGY
	CL+2xTlAqSDNpVYekMu24yIeNvQ9Tnmd0cYa23JTtBwzYJLrTK0i1iKKyxx5GbHmmXRr6SN
	/1IaZblFUgFL1cKH6ghhXMSTrn+f1lOF6mhMHDot/JgETyulZe31Z68XEappkNeqedBBzcS
	wjWADP6XJ5MuCQD+dyOoz2CMkxbmaJU3Sj2oIKZgmOIK1n+Ztez8sqi2I0hGPglLCKGIvF6
	ehZHP8jCMpNnwuuL9y0+UwHKnt2x07donwqqwqZIyw1kri26jq3dQNPWLSyuf8O6Zam3+lM
	5uwt+nOS7drhqDd+OqnS/S4OQZzI7lSHEMrjcEbG+uMGM3kTiwZULfg+oNUSygNRe2AYxui
	+bzLIiZKGtY7xnhFOYIp4c7fek4uCgd7EkalFWgsSd45Swq48ve+BHC618eFpBb3cvHV4/H
	OanC2RKJ3FV6n+ROq+fxZQ+JuVUlTajB5P33YcG27RhM1ZeflAvc7y1oJVjCp80u8gjXk7p
	5KkpS+JKOjiCKdIysCJjHoN8u2qWtxJnPGfS2EXFsXr79tZgag4yo6eBD0W3jeAzFB+0Ftd
	zF/ByPe5HiQiJ0q7uYUWDgh7QnDOaJgOg==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

--781b55b6c1a4b8d869ac8afe61faab8498bc4cbf4cf36fd0c52106658e40
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 4, 2026 at 2:07 PM GMT, Ali Tariq wrote:
> The k1_pcie_init() does not set PCIE_IGNORE_PERSTN bit of the
> control logic register, which causes controller to reset itself once
> PERST# signal is asserted even when acting as host.
> On Orange Pi RV2 (SpacemiT K1), this resets the controller and wipes
> the IDs. k1_pcie_deinit() leaves PERST# asserted, so when k1_pcie_init()
> runs again, its first DBI access hangs the CPU.
>
> Set PCIE_IGNORE_PERSTN bit of the control logic register of APMU
> in k1_pcie_init() before enabling resources so controllers
> dont end up resetting themselves when PERST# signal is asserted.
>
> Fixes: ff64e078e45f ("PCI: spacemit: Add SpacemiT PCIe host driver")
> Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
> ---
> Hang log: https://kernelci.cloud-v.co/scheduler/job/420
> Fixed Log: https://kernelci.cloud-v.co/scheduler/job/430
> ---
>  drivers/pci/controller/dwc/pcie-spacemit-k1.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/=
controller/dwc/pcie-spacemit-k1.c
> index 92a71ea90ac3..af6028e8825a 100644
> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> @@ -47,6 +47,7 @@
> =20
>  #define PCIE_CONTROL_LOGIC			0x0004
>  #define PCIE_SOFT_RESET			BIT(0)
> +#define PCIE_IGNORE_PERSTN		BIT(2)	/* 1: ignore PERST# */
A similar but earlier patch can be found here [1]

Link: https://lore.kernel.org/all/20260924-spacemit-k1-pcie-fix-v1-1-002b5c=
1ba9fc@linux.spacemit.com/ [1]

--=20
Troy Mitchell


--781b55b6c1a4b8d869ac8afe61faab8498bc4cbf4cf36fd0c52106658e40
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCaus9tiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+1ewEAxnmEsrQaM6nt
GVmv86UInDT8zrl4WBXpVCs6pA5yKNAA/1T1X2kCyy7Yxg7Ot0fX/xJgCZje/tFS
dD2FLsLq/R0L
=hLW/
-----END PGP SIGNATURE-----

--781b55b6c1a4b8d869ac8afe61faab8498bc4cbf4cf36fd0c52106658e40--
