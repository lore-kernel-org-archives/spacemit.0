Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BFE2253EB
	for <spacemit@lists.linux.dev>; Sat,  4 Jul 2026 14:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783173687; cv=none; b=sNWT/iSkplExACUESgVArmr7NSl1OhLXarDFOIbjSvnM9bP3u+AgdSUygzdb/9c9h24KoVMUVv4j3aiVvFOnS6EhGcc4gsfjfAy2YGFEpFaA95ghSq+08YHm9sVXaMjkAUOhTbSOZzpyt3f172r4JXfH7aJd8AMKFgGYroWz8NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783173687; c=relaxed/simple;
	bh=X/aUfjm1ytiWBQKSsoJFWVGuSu64ruDLhkhKQT26bFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=eU/rOgdgOc/jp926vbtSo6KQYGm9NQP9zt96NnYu2OZMZLSbt6ZtaaGp7YHMP9MtiHGklGQxWVPPlYLIHzZYpQfj9AtK5lIoUTqHfAVO8KtmWqFsseysg1qZxuGAGLbynWai2v3n7ZGsBYpeOPD65vUViXIFThx5dNbYDIdPRUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MaH8DCWj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MaH8DCWj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783173685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RG/qppTW5QiC+uZfEkeQXRtZMh5udm6vGfwyGZ5WcNg=;
	b=MaH8DCWjPv/trVmcQJEfk53MWYzsX/W7x8C69k+x3ogR1T3T+c7LdQJhW5lO23KTDedAV7
	ae+rZVGzM3GkRbaadfw6GzKEIhodszLtST4RG8ijS3kNnp7Sv8ED3RgdsfcDEtKv5feEol
	vMQOqGvFswqZU2/VyG7QO/eYYtdfG9s=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-YTlyw670NjiEaEtckibDcw-1; Sat, 04 Jul 2026 10:01:23 -0400
X-MC-Unique: YTlyw670NjiEaEtckibDcw-1
X-Mimecast-MFC-AGG-ID: YTlyw670NjiEaEtckibDcw_1783173683
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7f582244e9eso41101277b3.3
        for <spacemit@lists.linux.dev>; Sat, 04 Jul 2026 07:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783173683; x=1783778483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RG/qppTW5QiC+uZfEkeQXRtZMh5udm6vGfwyGZ5WcNg=;
        b=p1NpD/l3KvDgil8PGmng2yCI5CZmjJJj9An4Wl8b7372IR2qfu2bAEbiMqoj3CVutV
         rbVBMr7yzPHpQ9qk4RIWaoS/MTlQxXyMIKqIqwMmMRAKFIqwWPp+wQWC8k6ETt1Xrv2G
         xgJVue12XL/K2pDmrncYm0bzUGBwj5DqCI7VetEtnRIrRNpfQBCCJraodquCc0bO7AmH
         AklCmUXRW2piSD9FS6fKRyNosgYVxwklpqEV4nDo2wi7W3VGbd9awNSHVbHWjsyubEyK
         xOf+CMiR8bAblol17E0QLSkwRkJ1avOxG47RrZpbrfXXnNYe/dvkV0qeajopn2CrcoCW
         sgEQ==
X-Forwarded-Encrypted: i=1; AHgh+RqY3TCi23r4X3j0lJUpsmpNlLDML0GLSaPSRF0ksV9MqSrEcxv9OIyMMTBUuDBBwbj5DUY+MwOg+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwofDMBISjrkYG3CnJjQDQ+uLUkRnUlHjkDBVtjBhCxjnLnMAVK
	ln/rwxlIb17ZlzAYCzWijqoKumVUy2C0TwGTodjGo+aammnYoEgUkGr2NSCGMqjMZ3v/pIDyVaz
	VNcTdTlIkN3SmCqx7OoY5Yl5gV++w/bcs9jOeHfU6cPnkh7LY1HY9BUH7WkEy
X-Gm-Gg: AfdE7cl/drvJCLZj1nRptAVawqmoJSIKvm55XB/Bs42qI8Gwy6dUZciIRPtjkFkoRB0
	npGMwzz2/mWgH4XHScYvWvkOt9S43UR2vUAUm01GuyxiEa03hl5JatnM7VIgWlZO22Bw6PJUu43
	HJtHCNyZ61hG/Hu1fLtixM+5sE/EZRv5YVSGLt3V9nT3F6zMz4Lkm9EH4hHDTXuwvQ/d14uwR+d
	B86zrGK+xDFmXuJGXgBPvUE9Y3llUtFcUWC7p6b4LFtsIslLmpZpZHZ8WcdYfV4vV7vTeKUrIdI
	nwX2J51dbp4asLbrJHKG6uWgkqKS/Bt96R+yc0iD01aW69qFoq/82bPqAvKMRN8=
X-Received: by 2002:a05:690e:454d:20b0:666:3330:3d8f with SMTP id 956f58d0204a3-66652e9dc1emr2462304d50.51.1783173682770;
        Sat, 04 Jul 2026 07:01:22 -0700 (PDT)
X-Received: by 2002:a05:690e:454d:20b0:666:3330:3d8f with SMTP id 956f58d0204a3-66652e9dc1emr2462196d50.51.1783173681958;
        Sat, 04 Jul 2026 07:01:21 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-666408b2d99sm2171811d50.20.2026.07.04.07.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 07:01:21 -0700 (PDT)
Date: Sat, 4 Jul 2026 10:01:19 -0400
From: Jennifer Berringer <jberring@redhat.com>
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3: Add UFS support
Message-ID: <akkSL1nQ5UieqHNs@rhdev>
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <20260702-08-k3-ufs-support-v1-3-1a64a3ab128f@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260702-08-k3-ufs-support-v1-3-1a64a3ab128f@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lhvZrdqBl1-aKT5NgH79FPtIq-5nJaPkA8I3KLx-TMQ_1783173683
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 02, 2026 at 02:31:37AM +0000, Yixun Lan wrote:
> Add UFS Host Controller support for SpacemiT K3 SoC, and enable
> it both on both Pico-ITX and CoM260-IFX boards.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts |  4 ++++
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts   |  4 ++++
>  arch/riscv/boot/dts/spacemit/k3.dtsi           | 13 +++++++++++++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> index 238bb03d0e9e..b37e1c7b03e3 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> @@ -19,3 +19,7 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  };
> +
> +&ufshc {
> +	status = "okay";
> +};

I believe k3-com260.dtsi would be a more fitting file for this change.
UFS is soldered on the underside of the compute module and not part of
the carrier board.

Because it is next to the microSD card slot, a picture showing both can
be seen in section 5.12 (TF-Card Interface) of the PDF version of the K3
CoM260 User Guide. That picture is notably not visible in the HTML
version.

https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/eco/k3_com260/com260_user_guide.md

> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index b89c1521e664..f1560a5a9031 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -221,3 +221,7 @@ hub@1 {
>  &usb2_phy {
>  	status = "okay";
>  };
> +
> +&ufshc {
> +	status = "okay";
> +};

Nit: if sorted by label, ufshc would be before usb2_host.

> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index 19fc9b49668e..6c0b0598d5c8 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -1186,5 +1186,18 @@ maplic: interrupt-controller@f1800000 {
>  			riscv,num-sources = <512>;
>  			status = "reserved";
>  		};
> +
> +		ufshc: ufshc@c0e00000 {
> +			compatible = "spacemit,k3-ufshc";
> +			reg = <0x0 0xc0e00000 0x0 0x40000>;
> +			clocks = <&syscon_apmu CLK_APMU_UFS_ACLK>,
> +				 <&syscon_apmu CLK_APMU_UFS_REFCLK>;
> +			clock-names = "aclk", "ref_clk";
> +			resets = <&syscon_apmu RESET_APMU_UFS_ACLK>;
> +			interrupts = <135 IRQ_TYPE_LEVEL_HIGH>;
> +			freq-table-hz = <491520000 491520000 19200000 19200000>;
> +			lanes-per-direction = <2>;
> +			status = "disabled";
> +		};
>  	};
>  };
> 
> -- 
> 2.54.0
> 

Best regards,
Jennifer

