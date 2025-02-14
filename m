Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2291E04AC
	for <spacemit@lists.linux.dev>; Fri, 14 Feb 2025 16:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739550414; cv=none; b=WQTSJojESYmCU/TR6xThcKoh/FkGgCLMhHRppKKAaF3BLqc39QwfCWePqwjGv+msMvtoaaXCct2x1tmhkF3h7YWsRsmKlFUF6S/0MMVP7RMdxObPkAM3NL7TMfjv1yeWJ7O3wBP6CBfS5e+Ija4TwGDpx6bT2zBKKXFzaBD1xk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739550414; c=relaxed/simple;
	bh=fqAE2/JMrhghnr7h0URaZiiOx0VrL9ZGjPBLMqFnJro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BPBTT4qehqtsxlhxXN6NQv1TnMPvXehvV0AvGw3qxGWWe4TPQRmaFjs4fRCVVm40C+vZGzRUV8JS+fKgKs7rcpmwquSr/ewtUHYT8DAuY1H/1qPLgzJHl5B/VSHaq6ieQmJMk/x4WAOmcw8+sNFDuOA/6r6O+cjWWh0F2qeBhc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Uw20gyFT; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Uw20gyFT"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-38f265c6cb0so1038287f8f.2
        for <spacemit@lists.linux.dev>; Fri, 14 Feb 2025 08:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739550409; x=1740155209; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yYahPJ7CPZFZpNoRGXLgzm0+xcyc7qKygSX7eH5P6s0=;
        b=Uw20gyFTTk2Sdw45TZFQtbK2QU/WZ98kyK1IeCXlh0GFeA5SuQB+c97u741I8QuBSf
         dXuOT15MtpmUb+iu3/+YW8SaGMFIQ1FIVCZSkPKyc2MTNLY6EdLZJTae3uTe+XYcMxf5
         GsfxLgm0OfCn02gIaurWXChUAGbMRnW1m1W0MYIGfbUSOxh15/hj4Mmr8EHDzj8UAhxc
         dpM/Q0fUGtj/d/BzaUpzCSzeqF5Fcm+qu2+fBQOnniyKAVIb1diNVUmt94bWPzI/pBLB
         CTRl7vXCD9VcHPJ1009Gmaw6xpPcQXJtU518Yniid8alOLgFPomfqZckNH9KZiwahZrR
         rNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739550409; x=1740155209;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYahPJ7CPZFZpNoRGXLgzm0+xcyc7qKygSX7eH5P6s0=;
        b=tRdCpoWuIf8z3EdSPsY0hqV24zWYBCLyL+Q2LCu87qw/oVIy3Wemlnq6tcGqjDOdq0
         QBr06t40a5OQGIvzabWdw/Ge/E7s571v0vkCvPxiIek3Ine2Zuqo3NvwCrbv94OfNztu
         bjdlRk2WrIqcPBvpE5FJqSvqVy4CSJZ8x7cUA1hEykOBf5GyRWZ8G0ZigS7QgcLFnjKj
         ZON4zisUDzmdj/AZtpTHNWdPhIJG/KPjin0tfQQNN/lpis7Y54d7i2WPMsLAJT5YF15v
         +Zvm+5AcpE2pan4IY1nxYeMQ8KuCjypaFtrZjLt1DzYPM4we5TDZkK3k+teH/WSeDHK9
         qysw==
X-Forwarded-Encrypted: i=1; AJvYcCXQP26qNGlKMc0AYumUzH8xRDG6FK9ZtoB98BLMCXsHrBqkVCExHiHnY8vDoEry4a6mnlD5M2EBEQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlF4J6DqOCTOsMzY+zqac40R8QwlBvymsu7+GYIitOJIF3Ospw
	LRaZZuSkfXxrkF0RvySketfmSn13FYgxksCHNWg9pbWz7ifsPmmksE78pM9MiH0=
X-Gm-Gg: ASbGncsnYyhLqDx3yROyrOrK8JMdVrAWDtaJSJpeF19AEFlhorKXFhQ4FZbS0FqjXFz
	W7fYQufK+6bTBKw4JUeWAEWxPClT8GndJShsH5BCTtGD8aXcDMsyjXVUQyO4g/sHCanPZZx5n8Z
	qpisB3GRQwqMqSlnJnHFKZZY/kk3LgotoO5Hp23XowchPwen6++PI/Gm52BCKFtBk+cDaMPIdDZ
	MuhDxjFb4/Pd7PyxFoDkllIUMpK2PpfJlbzOQf8GFQoMJqASlvoP7McCkzwh7AkNDo3W5aM9Yuq
	9MvncNnsRAqs
X-Google-Smtp-Source: AGHT+IGD0ZwSKP2SVlV7tCbb67DNu8v1KQBEuuR8bN5t8fbcPighOdQVzKxfEH8x4T2JZ2zth1XX9A==
X-Received: by 2002:a05:6000:1546:b0:38d:c2d7:b5a1 with SMTP id ffacd0b85a97d-38dea26ecdfmr12656044f8f.19.1739550409013;
        Fri, 14 Feb 2025 08:26:49 -0800 (PST)
Received: from [192.168.2.177] ([81.0.8.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258dab74sm5084116f8f.32.2025.02.14.08.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 08:26:48 -0800 (PST)
Message-ID: <05ec141f-8d2d-456c-830f-f5ea2adce671@suse.com>
Date: Fri, 14 Feb 2025 17:26:46 +0100
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: riscv: spacemit: Add Milk-V Jupiter
 board compatible
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: javier@dowhile0.org, rjones@redhat.com, abologna@redhat.com,
 spacemit@lists.linux.dev, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>,
 Yangyu Chen <cyy@cyyself.name>, Yixun Lan <dlan@gentoo.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20250214151700.666544-1-javierm@redhat.com>
 <20250214151700.666544-2-javierm@redhat.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20250214151700.666544-2-javierm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/02/2025 16:16, Javier Martinez Canillas wrote:
> Document the compatible string for Milk-V Jupiter board [1], which
> is a Mini ITX computer based on the SpacemiT K1/M1 RISC-V SoC [2].
> 
> Link: https://milkv.io/jupiter [1]
> Link: https://www.spacemit.com/en/key-stone-k1 [2]
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
> 
>   Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> index 52e55077af1a..077b94f10dca 100644
> --- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
> +++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> @@ -21,6 +21,7 @@ properties:
>         - items:
>             - enum:
>                 - bananapi,bpi-f3
> +              - milkv,jupiter
>             - const: spacemit,k1
>   
>   additionalProperties: true

