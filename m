Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB48041E6C0
	for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 22:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785276912; cv=none; b=LXysMz2sES9xvj4d9vS13hB89GxSYkvFnG6M2O5zrS4bNWsYZ/jDi7l1CRbVShBI1yzBsSOiv34cyBuxtG0wwXSbX/P92+OedQmcO4A7UxLrus+6GN12ebt+clfoCJM3k/DFHsec4druH7YYGK7rCdfiFHXMs3kHFsSzbELJ71I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785276912; c=relaxed/simple;
	bh=qyGMjhTOnnZPm6V71sYf9uJH6BivSGNSOmxkf0a+A/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ffMxN05S4Ax1S0JcRTIhEcACppc+eaoMUraQa21ar8dYOP0F55cE9qEJVy70QKD2JLLipmglK58HMX2GchhCPPvs73yEIHPzUuFZ4PBoXdc+kq89ma2H0mgZ9v32AW92xNTzJhcCJdD03gqP8b492lNZAx+4sTPqErhux7iWY38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxatLWp3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxatLWp3"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc891373e0so4490715ad.2
        for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 15:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785276910; x=1785881710; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HUzpeU8PWsaIt3wcpet0Z2+r1iwdbUXIMb1YKO4g2Uk=;
        b=YxatLWp3dJU2HBryg4ypIgR+8pefhFdTPzk+iePLjQ0vzriMT6TQ5B+Uz/9K8leioq
         ypCUk2X0MLtnBQgKj+viJnmlVwQ9SqlPqBLkiPTWwn6SM6S0BRGlYyk7KhKg2V4HnnZV
         4HZ2iCawIDP/Riqoqdo7qim54N1WUwiBa9EwWHnhHsDq+/FAPqcUHTyctGkivti5DPwG
         Ko91sMwSpe2nhuVoZL7ZnOiuMW1nhSxn5lRdDzIimrxGVlpol7eO9doluU51ZQGJohF9
         n1iNSaDnVrDaBdDjiL/mP9J7nzznZ84JLWaNF6aRj6MJlefHRUan/Qzvik3GUD4Dljii
         jSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785276910; x=1785881710;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUzpeU8PWsaIt3wcpet0Z2+r1iwdbUXIMb1YKO4g2Uk=;
        b=Eiqf6pgoNacRhTL4+PN9T/5ccMQHH4b/jl6Jx1+nPkFxBBBHdAencD5LZnNpFBeMBB
         n5BrJHnvzZZYDKxjw/r0/oAlmUpg9Hk0Hupwe71T/Vdk1GnB41i+eo7zbPmhGCULLyw0
         oCGj41dGKE7TMKuc3E/PiOjwX3FPlwPeY/wZvny6ZxCY/feUURW4uVnnbtZIv84kGo8J
         qkbW8omsMPG7YLnIkwj3vIJaT6qdwqh2xsZOtWSzAnjYrkh87bj9Zwh9TOoZo/sHibL5
         iZR7iPlIb6yu2yG77g26nEcp9jh60+EG3HwjAEfQL1TesMcMBEs3gyen2YktrqZod8CH
         qKnA==
X-Forwarded-Encrypted: i=1; AHgh+RrxVhuL667wQJHHZ1QEBXs+rhtLhl8/yti9taYSxNqew6wW/srtXQzxFOcEgzd8G7ARamEsH3yHuw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yww9wobHJrKQqoYrdwl+NQwgbC38eqz4eoI7z9UKqzVtI1/+4Jo
	lDOX9dA5fo/Yooc9DS8IGKN9QyMJPcLAF4BFYt/LD0/G5bIqOfnFUI29S6E/aYsl
X-Gm-Gg: AR+sD11dkIAJ0mG6W1Bi96yIr6xoLIVUF1XpCGtHKCPrROzEU2JW1YVxHgwYezEp999
	4Dl86EnY4//nYOLv/6JbcZxUZgL4gf30AfloGdumea9KX9GUbS3XcXWTDaiK5lhWCtR4bboZL6Q
	TMW5touYxK7QeXB0/CdgP2KHMl0dzhkzjOURI0uFvT3ELkmPSD+IST5x/qx1ER60Ex74t9YV+pu
	sGm4UbbOL3TsIcBbLWcJ0fuG7XL7XSXkpp1lQvEzDy1nWjCESBP/IAEC2to5AW28uOKevqsjYUN
	IGRMf7gUVifV1i5MhWF5LRrOY38DminVmq19uDyBMrbY+cZrWcZbH8Pqnvhzo567DiN6ElJtxRB
	2p6txxSCWtR3bjdkKUrIU3BXwjsGKCFBk3302YapRSMh6GQOzF/2AXcEqrxnZjNwcIM6FdebfMw
	fqsb27rid1J7UJBdwVebJhPP4WEn0r0GEkODpw40fFGwQakNZIpQJGdaYuFFY=
X-Received: by 2002:a17:903:4b46:b0:2cc:a853:1311 with SMTP id d9443c01a7336-2d015eddc78mr55167005ad.47.1785276910228;
        Tue, 28 Jul 2026 15:15:10 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a18abasm2246025ad.5.2026.07.28.15.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:15:09 -0700 (PDT)
Date: Wed, 29 Jul 2026 06:14:59 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH RFC 5/7] irqchip/aclint-sswi: Add generic
 riscv,aclint-sswi match
Message-ID: <amkprTVtjkRVEo7G@inochi.infowork>
References: <20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech>
 <20260729-k3-aclint-v1-5-aef88614d3a5@pigmoral.tech>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-k3-aclint-v1-5-aef88614d3a5@pigmoral.tech>

On Wed, Jul 29, 2026 at 12:36:31AM +0800, Junhui Liu wrote:
> Add match entry for the generic "riscv,aclint-sswi" compatible string.
> This allows future SoCs with standard ACLINT SSWI implementations to
> directly reuse the driver via the generic fallback compatible (at least
> until hardware-specific quirks are identified).
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/irqchip/irq-aclint-sswi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
> index ca06efd86fa1..2bd40c3ea288 100644
> --- a/drivers/irqchip/irq-aclint-sswi.c
> +++ b/drivers/irqchip/irq-aclint-sswi.c
> @@ -179,6 +179,7 @@ static int __init generic_aclint_sswi_early_probe(struct device_node *node,
>  }
>  IRQCHIP_DECLARE(mips_p8700_sswi, "mips,p8700-aclint-sswi", generic_aclint_sswi_early_probe);
>  IRQCHIP_DECLARE(nuclei_ux900_sswi, "nuclei,ux900-aclint-sswi", generic_aclint_sswi_early_probe);
> +IRQCHIP_DECLARE(riscv_sswi, "riscv,aclint-sswi", generic_aclint_sswi_early_probe);
>  

Again, use vendor specific name for irqchip declaration.

>  /* THEAD variant */
>  #define THEAD_C9XX_CSR_SXSTATUS			0x5c0
> 
> -- 
> 2.55.0
> 

Reagrds,
Inochi
