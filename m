Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596558;
	b=Pk+VJiVNU+cWpeJ8s173QR6rAvWbeSWtL9dhvfZUwuq1g9mX+c/oia1hC49CBJcbB234
	 jYrPOx1n5WCXP+VtR0eVv63dWzdJKR0j4Vqr/3e99DY6Cu90mCoExj8z9VyKEUWBUQ6tr
	 pqcnfKg48HXMIJ2rjAcCMUuDyvMccWWIXNsun2G/MFMeDRGRx/IxX3IG/OOyYKSbi/LX/
	 c1Ba6mmzDC6C0nSrefp0/v0hVrwcAkXD2nXq5+0/LBpf3KLrRusRsjMcQfRMSOND22jYF
	 /iT5ST3VZSKx0qLMotDo3Xs7KG3wcbK54VLyJS4M8gIvX0nPdM5JrKG752qSKPpWkmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XoBUSoCkv2nIwetH2G0D++atFkrgwpTcXSMeJUec7JY=;
	b=pckrT1qdCSyLzBYVUDv/ClySK80hnh6HsygAjF6crrIMLynBnKXALuwgMLL4UmFvqiZ2
	 W7ouYbUSMvMhF8iwHP8G+zFCL8HG5xTBcL1hcchAic8YDMTTyNUyYm4xQQS8kabOKDiCp
	 CFOrXpgicXQ9ll6hdN20IkCtAkxk32LSZE3e32u84cm1mEO6mq99R42BR0mDNWcw29KDi
	 ZrVPwUY9zPvuBe95z4ZgRYMEOiF4zvmm6ivWLV7XSdZhxdTwTxcy3/mWgGGn2EFbIOYsV
	 PbgisQ2bXcI0x4fiBoVWFx3p0mKExRgBWRh2egPOGQnWWl6FDGZTyMgrKXgc7dDNdzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vplljtau;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF8A606A32C
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 08:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FF8A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vplljtau
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso2799938a12.0
        for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 00:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596556; x=1796201356; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XoBUSoCkv2nIwetH2G0D++atFkrgwpTcXSMeJUec7JY=;
        b=vplljtau5e7Md5Z+hgzDT/Al3dCGRwGo3C0KWsHZCb3RSDXGpHMC7D5gcDJdxY+ybP
         evQXamDaXJwlS/5FdE9uElGrCG3NkfnKVc4vAPqMLNjwlkRCzakGjxr/5k7TetgkHVEn
         wvGy9h9LHmLqIfkAbWTCeDBMKVfv544pTUzPvT7m2KcxbQHmjxAMYTR3aGAF83Ifh+nG
         qYPVXseiFQvhRsGu9TGN2oUtioJGp1ZDHz3CD41rJ2c/mTX0W9du0EiUWzEiL1D/QAX5
         SOgXhjMS02lZSpaJGLmpy7KK3yYgabjjHDni7mMZSUhTkKvpQCUrBawbIvp36WNCrvQs
         x2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596556; x=1796201356;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoBUSoCkv2nIwetH2G0D++atFkrgwpTcXSMeJUec7JY=;
        b=eMX5VUg3rfFjXyAP7PTnQqfFcTWGF3jh1UPlqS2ffJhz9BqpGx3WWEx4d6tZHSnUSs
         L44rLbPQ8+ZqL3OtoFRCYlYcq5BsUGZFh23bip1d0dOJnowqapCCuChzJpA5JmJfkBp/
         fQrL7ECgkqd/WEQAWLL6GReGWBPRldhaAdnPxPzdz7kocVVWVLVeENuTvFB6k0fV/947
         JKbbnvMcSvB4g3kgvdlQfpTcEFinMuZdC1KCcWzAcPtrhslPhB8z9OMRT3aExeW1V38s
         4hxoeajvx1610g7f8NQcQZjkyRYGMW2+44zYkBpnXPJI8LMbHaK3OLph0a3JD4vjnz0U
         EHqQ==
X-Forwarded-Encrypted: i=1; AL+hErFp6u8rHOv6LlzFxwzDZCVDuBrMfDODR2HmNqhpvheQ91XZiZxsi2Pq3Z+Og0pQNAm7M0qgq6bT2g==@lists.linux.dev
X-Gm-Message-State: APuU4Z8rO8IuLhJ6dATQ0+/vlrJiif1X6GP7UBHibL3h9gKzxVVUo8XO
	D96NMYLTcMK7rhYsy2tbh1vZgByzfZRlZDRkYaANffHWd0Y753NIYFWN
X-Gm-Gg: AZFdTZf+NaCqXTvCL637NV1UqqsBpZ8iKkK5gCLmi3of3mydAbhAC3FAPsGkxDQY1/Y
	1BVeC21HDxz6Via0kmb2ekniu+YNaLaT8DcwrbzklhM0Fzg3ElqLiOKsUKsPeiju5Y2fPbbQuN9
	oazgw8kkaDkIVyF4O6VIJw/gJRek7yzXZn4ZvirXnzf4tzPySQVhjPh22L8X7yWHA/JcWRHnh5h
	gjkiPiiFeuCCT9ZA/uSYv8tAyxMEYZJsMYWS1E129aa9v/3RPeTi3RLezwc3iloH138M6uil7ZO
	xPoG2Xj3In5tGIS2s6qTN1QaEPif8dtX6mGLcbW2aXhy9sfuu/crbMlSdDV4P1GwuKKfYV5gqFb
	g8DSD84FlstMnQkK/40N7XuXbnHxjHCxrfmoVOSn0nWxd9h/XKmtRpjFWGqcTBtfT+FlPzKjlbG
	nRYRTsYfogggDoWgo5++QWz24DSOvf+QfyjBeIi62L4ppTBtZV0y2K9KS8LZHYFHcJ7Q0GK1/1y
	kFZZ09veI3NJHAcPJwGlsIVoPU5KhgjKRygDW/SgXgH+4dVJ9W+bdnjzFvMj00Lk7gcNKlCzj1e
	5XqUk6N4xo41sixapWOnE0q6mw==
X-Received: by 2002:a17:90b:4d10:b0:3b3:ce10:7659 with SMTP id 98e67ed59e1d1-3b41c7ac261mr16316108a91.5.1795596556346;
        Wed, 25 Nov 2026 00:49:16 -0800 (PST)
Received: from duge-G3-3500 ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm28307740a91.3.2026.11.25.00.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:49:15 -0800 (PST)
Date: Wed, 25 Nov 2026 16:49:07 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: Add K3 eFuse and
 temperature trim cells
Message-ID: <sifzfexbsbd2byrpynbv42habxgbrxgndaxqhsjgppyipfuivp@qvawoamxksfu>
References: <20261122173810.2409146-1-duge1256@gmail.com>
 <20261122173810.2409146-4-duge1256@gmail.com>
 <awYIF2ynf95-g5-W@aurel32.net>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awYIF2ynf95-g5-W@aurel32.net>

On Tue, Nov 24, 2026 at 10:56:39PM +0100, Aurelien Jarno wrote:
> Hi Jiayu,
> 
> On 2026-11-23 01:38, Jiayu Du wrote:
> > Add the K3 eFuse controller and NVMEM cells for the temperature
> > calibration data in bank 0 and bank 7.
> > 
> > Signed-off-by: Jiayu Du <duge1256@gmail.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3.dtsi | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > index e89d2cc5ca8c..af1a758788ff 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > @@ -1439,6 +1439,29 @@ saplic: interrupt-controller@e0804000 {
> >  
> >  		/* sec_i2c3: 0xf0614000, not available from Linux */
> >  
> > +		efuse: efuse@f0702800 {
> > +			compatible = "spacemit,k3-efuse";
> > +			reg = <0x0 0xf0702800 0x0 0x400>;
> > +			clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
> > +			resets = <&syscon_apmu RESET_APMU_AES_WTM>;
> > +
> > +			nvmem-layout {
> > +				compatible = "fixed-layout";
> > +				#address-cells = <1>;
> > +				#size-cells = <1>;
> > +
> > +				soc_rtemp_trim1: temperature-trim@1c {
> > +					reg = <0x1c 0x1>;
> > +					bits = <0 8>;
> > +				};
> > +
> > +				soc_rtemp_trim: temperature-trim@ea {
> > +					reg = <0xea 0x2>;
> > +					bits = <4 8>;
> > +				};
> > +			};
> > +		};
> > +
> >  		mimsic: interrupt-controller@f1000000 {
> >  			compatible = "spacemit,k3-imsics", "riscv,imsics";
> >  			reg = <0x0 0xf1000000 0x0 0x10000>;
> 
> This looks all good to me. The offset and bits matches what is in the 
> vendor driver (after mapping each bank to the correct address).
> 
> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> 

Hi Aurelien,

Thanks for reviewing and testing. I'll include your tags in v4.

> Small nitpick, no need to fix it, but the vendor device tree also define 
> offsets for soc_die_id, soc_ver_id, soc_pack_id, soc_chip_id and 
> soc_svt_dro data. It might be useful to export (some of) them.

The downstream socinfo driver uses these cells. If I work on
upstream socinfo support, I'll add the relevant cells then.

Best regards,
Jiayu Du

