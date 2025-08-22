Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E1A2AE8E
	for <spacemit@lists.linux.dev>; Fri, 22 Aug 2025 01:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755826342; cv=none; b=MFppevJ1zyTxVVWNiMl1x+JsKuyJJOWMwLQCzZsnDhqqxHjFXUygtq+LvJdv3P8Zf6rtWnvYxqxElUS/miRt/fVmFdGswYwD+7nIaPk+/cDSImI+HckNt/3ZKRyzsXYsxEVB9FRu6DAu+aB05rBjR05naI7n+2YQh8+oOwMkMiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755826342; c=relaxed/simple;
	bh=Wg6B5bcLCFGQGWcq0+K/fyju+Mj984O0JHIBAY+rP78=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fpIygiIhr9kH5rUaIxx+FoTONI9l0LQu50NdVXtSZI2u/CDgCr7k2nPs/GwUR7j2yBfa0m5CvYXUpxVl42eZR3bOgJCyOzJG7Hh6zLdtVwop9abH7T9Kp/Q1EBXVVwuF0/YFwodN43RN0tK27P8/NkTRcy732xTvo9UXEoujvSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHKQhwZv; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHKQhwZv"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-32519b32b6cso305934a91.0
        for <spacemit@lists.linux.dev>; Thu, 21 Aug 2025 18:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755826340; x=1756431140; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HLZ4xRwf86hNbCUyOlRYqjM/i0x4T75qp61KARr1Axc=;
        b=SHKQhwZvyDiZfNt5HRTMAqGgGyQFn08RpfyaRMkFEV5/iBFC/F+yaj0NQLBJ14s+Ze
         s4g5zgeiAhp/5PnZWv+ZI/aU3O7tDU04WM46AtybCv5sBDuWJhXGqLZpQ2/Sx2jxJJor
         AhpWEuq7/hSGlSf0Mkj0FoNiZeJisQP+La6ONT6gVMr6iFyIwo0MeDDsLID/jCuDp8t3
         pJ3Ws1FqVQWZTSkhpkaoEpX3VFf+avuR6XKtTI3iuocENd2iZBiwuyTMZyME1lA7LbV0
         qfZgX8zGLRE4cBTJJCPSJmppNGiws9/rOGgW3PkWDgSIpqti0kSTydd1ygBtrRhw87Vo
         oZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755826340; x=1756431140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLZ4xRwf86hNbCUyOlRYqjM/i0x4T75qp61KARr1Axc=;
        b=DZZhoNnGtqf0JpkUEyNFbgt/zYxxLQH3BZLMhUW7oJ38NYAf9Ifadaru7a91Nh1bJO
         RvgBVh2vv7gQzgg6LAxGQ8eRavinmgqDni7zkUrfwB8+1xQQBaF3C0oZMs0d2ApjjIOI
         8Y8+TSMkw1c+EHWNi9FvKGbih3qa6RL5ByWQPqV3tVZI04R/Ii7HVIYlwEIdIBoK844h
         ebAoidWC2J7wo30dmQf/1BlbeqJKbQGwIAJat9P7m4Hed2xUMtlPomYXQ8Hk/9f7arRa
         uQYOClav8FZguuykiQ2Wu3PQIM2bz7+sdx3+7faJE2H7f4gVubJFoE4irsnnr3ci640H
         En/w==
X-Forwarded-Encrypted: i=1; AJvYcCWOEVGGcXioU3/iBeRzUTL89DSE7tfZy0NWyT2R1ztiPf6ceT/9q75IGCeoJGr3KPpPu9FJie416w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzplY0CL8GtX+UaqRargLTD3Ve+rM4R6N6ORJ4/S4nUJJp5CEDC
	puJPkGt/WAR4A8socRr6yRvRWVdDohKFbhyea2h9RNy+GRbZlgBcjTzD
X-Gm-Gg: ASbGnct+mMkXq2X9e7eF6t8XeTp8ngcczcqjDA1cTi6kvuijFlT17XI+wOR+Fb5mzAV
	LQxWYJe4FuJ8BOgbHgiByhjaYymZU5/1zzmPpNkUqixsoYO9cQx9XeBiPJbQo2uxCv7Z09dx5ot
	7PDCDZLetKkK1jo61ReRdJEI9Bz3ZhoN4DGfv3KSt07wPDxSFbE/9u1FtOUHmTCr/OmVsEKjIpw
	RbnV73PgwqfigXJJnyumzdcaRFKZ/aKbs0iFUGkxpHKB0UDRsKorieBXTD2vPeJd8+K+Yu5JwzY
	N8bnDF9kY0nLdvQymml1lWiukPEH9H3GnzaOoEOQI3v2ZWxhwAhHgnZKrCYZ2tWNfZIHaHZITw4
	+Fls=
X-Google-Smtp-Source: AGHT+IHqg5BMS5H5H0CXatOkDxWYnVma8locc0gsDLlLL4jvBLJblPVH8Oi76UEBkFgq0T0ofvpIFQ==
X-Received: by 2002:a17:90b:1d91:b0:321:59e7:c5c5 with SMTP id 98e67ed59e1d1-325177426fcmr1615455a91.27.1755826339746;
        Thu, 21 Aug 2025 18:32:19 -0700 (PDT)
Received: from localhost ([2602:f919:106::1b8])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-76e8344494dsm8737468b3a.79.2025.08.21.18.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 18:32:19 -0700 (PDT)
Date: Fri, 22 Aug 2025 09:32:15 +0800
From: Troy Mitchell <troymitchell988@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: spacemit,k1-i2c: Minor whitespace
 cleanup in example
Message-ID: <aKfInxTH8XeZo55z@troy-wujie14pro-arch>
References: <20250821083205.46600-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821083205.46600-2-krzysztof.kozlowski@linaro.org>

On Thu, Aug 21, 2025 at 10:32:06AM +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> index 3d6aefb0d0f1..c1a3004df71d 100644
> --- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> @@ -53,7 +53,7 @@ examples:
>          reg = <0xd4010800 0x38>;
>          interrupt-parent = <&plic>;
>          interrupts = <36>;
> -        clocks =<&ccu 32>, <&ccu 84>;
> +        clocks = <&ccu 32>, <&ccu 84>;
Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>

Best regards,
Troy
>          clock-names = "func", "bus";
>          clock-frequency = <100000>;
>      };
> -- 
> 2.48.1
> 
