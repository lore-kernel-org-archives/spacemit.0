Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235AB40488C
	for <spacemit@lists.linux.dev>; Tue,  9 Jun 2026 18:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781029492; cv=none; b=uSfLypGYw4+xqV57s5+emyvmXKafTJlQLkLKfpMi9LscYialwMbf688QGcQE7QvsAHtk6cx+0F9NA8E/Gb69gZVHLJBg2MHi0iJYuipKdJ4pJt9EAeLK8rL3a2Usfh1IWziOQJXDQvHGPOW7x+ku4wIQzuMA7RPaHINQ1hiLszk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781029492; c=relaxed/simple;
	bh=cYprcqby07aD8H622Y4drSTVA2JemKQFeIJ8S7r/+Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MbwL6oDai98K1Thxl2+XVBqDbL5VkKg3xkM+8hgGOzqusNzidn/ZlLgh5QunEvJcMeq5M8f47H0cIDA8boF3POUSGOPEt65NkRtGqaty2j4eaWNPxIVk4wA1/kbB2UZr4pIPJBukfKN3gTiy5v2RhabS05I2YYW5sTNn03whIGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rembrandt.dev; spf=pass smtp.mailfrom=rembrandt.dev; dkim=pass (2048-bit key) header.d=rembrandt.dev header.i=@rembrandt.dev header.b=EixPZ2KM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=daGzXBDp; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rembrandt.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rembrandt.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rembrandt.dev header.i=@rembrandt.dev header.b="EixPZ2KM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="daGzXBDp"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 250BB7A017C;
	Tue,  9 Jun 2026 14:24:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Tue, 09 Jun 2026 14:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rembrandt.dev;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1781029488; x=
	1781115888; bh=cYprcqby07aD8H622Y4drSTVA2JemKQFeIJ8S7r/+Z4=; b=E
	ixPZ2KMTPtrBWcgx5w8G/hiz0XIr//c07Li4camk8/JBNA8dZE+t2qd94lmLOOY3
	epq/J5GTF1JeMuEDpw0d2s3jaWS8lT9B0+sVk1xxkEkqSuTWQcg3mrPMCivgEK2Y
	HC5W6rwGuTB1wR6jlUvQtcVst03yyd0QVi0joP20c6dgsIX9J/XHCk1upAW1ejK0
	UVrMbVC6MdsjxjFMHEZAyh5Vlj+FSmKLr8ITiBSrpyjzBIHM24vmTxpCWaKadv2n
	JDYaLLgAFTZlrzHnmyICJqpmPehpIxdWOvOpeAf00HZoCwPrO8gVJBXpHlKhNT0z
	WMiJh7FXnvhxhgfkQfznQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781029488; x=1781115888; bh=cYprcqby07aD8H622Y4drSTVA2JemKQFeIJ
	8S7r/+Z4=; b=daGzXBDpWuelL4RVm/tpHueKcaTVhfyc2xVBiHfdlClsf4O4jCa
	7jM1YWuTiL0moRy5VYrX7cuSgtlF0M+CsxbiCs8guZLbRKJUWyJO1Bj8+MNkPzm3
	cif0IlUDUIjWqQKP5aK6pKxDpPbkjir70OHb8M1MSoiPWj7hyZNRENNaFeu6LPFe
	fkIZxNunBTqJaxMDN2e2C1iKz8ISMfu9oRt7Pb7LYiRy3PrCRotQfBqiiYYcXaSF
	wbMb0KMNKgxtVmDgV5SjPomUVeDKYiLoaj5nheJLWKnNPgl2Eu357268bav4IGOk
	AcpDbZmoWiJKj3WMFtZ6TNRBCHn/uKzGNfQ==
X-ME-Sender: <xms:cFooahUZmfI8ZWfVuMTS4j2cbJJH5QEOCKQOnREJzOAISa9mDcuvLQ>
    <xme:cFooaqjlEDHDbNiVxanXyRX5msD9EHPz5KfTJ9Y5MeMKy3MCMzqcCWycBguxfmdk7
    LU72yOtoBwgqefiF835GvnETcnRYP8AKtxfzwFeDdBYyZaBdCGr>
X-ME-Received: <xmr:cFooao8AoM-3iVuTHpMTIwnsIJ_hxhSPJEIMxw48qJpk9jrCzCIM9qiMkd0>
X-ME-Proxy-Cause: dmFkZTFS/rLKkzzrwQjGc4OyFeT9ka5Vx98G66TcKfRWgrNpaGXQ+37ZpynXpSDv5HcYc6
    ujBcVXTGtHId4F423cwtbfu3KBYGGmBJ8NYo7m5u91coeLroixEFq2X4iDT00GE2ivhlsD
    Ym78+iuTKYMVeA+ZFdx+Lq8S17J2qSvoBjWEnrQtAh5HF40wIt75FeXR0G48w9paeC+ykx
    8ElnZOHZFOOwQTSnWulMh6C3eLnrOyH/M5q21lcIotJRtMvSZVDoKAqGjVvLO1I9XOzzIO
    UOgY4q1OJb9f2L19lBVX4+QeWYZqsRYPHhocSLQquySetI+lvQVTJDKIJcEGGqaGXhBzdj
    Jpk7IWVA+R6DogxT7DlfJQ9bkEeVGzCyXdfUzlv3L4xN8fD8NLEKu0+kyo8mXxMhudCPdR
    SG4QFnLiHs7Je0wAzTCEDFe/7teVGcSM/jE3gVdJeA0VtVZ5lakf5ZX1kDRzvZLDEM6u61
    7Mk43JzPvoV8JPHgEAV6MA1GZEtdO4f4f92zmZPU5ri9KBbVS+gwtje9+mx9ZA5wMyGGmz
    A+iNzlFue07yXZqFiedJLVRdJcopFzGL5O/b+5qVWT1s68ieRXR1PG27f2rqJ3PkR4EHfW
    W7jBYCHGAoHImc27LGZKUFe93tW3shlELaeQiD8e/VO33hpgpPTQpWh4C9Vg
X-ME-Proxy: <xmx:cFooakb45aQJSvtjdLYg8LqKRvggHLeb_o2ufTavYkx31xuojNiCUA>
    <xmx:cFooan30RLAxx14o9tJ0tRP-4iX8Ezip_ho084LOQoW0CH0CltVVNQ>
    <xmx:cFooavbWLa4u47oQrdn-owk_yz8jBXqr6Exug0Pt2MQQBdjdTRB4xA>
    <xmx:cFooavJZ4z2XEBcSvk5VxU8eTFmr2-zKZG3LCVNJBs6pUuuViO7Y3Q>
    <xmx:cFooasGkl9V7dLPmVaTlqz1nbQKaIXvsEwgTVcFIGWri2yxt5UphMX0L>
Feedback-ID: iec564b6b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Jun 2026 14:24:48 -0400 (EDT)
Date: Tue, 9 Jun 2026 20:24:46 +0200
From: Andrew Rembrandt <kernel@rembrandt.dev>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3-pico-itx: Fix non-functional
 ethernet TX timing
Message-ID: <aihYftGNcpUd4UUR@mcmanus>
References: <20260608182358.170489-1-kernel@rembrandt.dev>
 <aiemGajqcQeY9avz@inochi.infowork>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiemGajqcQeY9avz@inochi.infowork>

On Tue, Jun 09, 2026 at 01:37:56 pm Inochi Amaoto wrote:
> You should set tx-internal-delay-ps of the phy instead of
> the controller. This is a phy in "rgmii-id" mode.
Thanks for the review. I don't think that works on this board, but
please let me know if I'm missing something.

The PHY is a Realtek RTL8211F. Its driver only toggles the chip's fixed
~2ns delay on/off from phy-mode, and per the datasheet that's a hardware
limit, not a driver one -- the RTL8211F has no tunable delay, so a ps
value on the PHY node has nothing to act on.

The only configurable delay element on K3 is the SoC RGMII delay line,
and dwmac-spacemit programs it from tx-/rx-internal-delay-ps read off
the controller node (spacemit_dwmac_probe()), so that is where the
property has to live to take effect. This is the MAC "fine tuning ...
values expected here are small" case described in
Documentation/devicetree/bindings/net/ethernet-controller.yaml: the
RTL8211F supplies the fixed ~2ns via rgmii-id and the MAC adds a 400ps
trim on top. Ideally the PHY would own the delay, but as Andrew Lunn
noted reviewing dwmac-meson8b, that requires the PHY to implement a
configurable delay, which not all do.

The already-merged k1-bananapi-f3 does the same thing: eth1 combines
phy-mode = "rgmii-id" with tx-internal-delay-ps = <250> on the
controller node (via the K1 EMAC rather than dwmac, but the same DT
pattern).

Would you be OK keeping it on the controller given the above? For v2 I
can add an explicit rx-internal-delay-ps = <0> to match the other
SpacemiT boards (k1-bananapi-f3 included) and spell this reasoning out
in the commit message.

Thanks,
Andrew
