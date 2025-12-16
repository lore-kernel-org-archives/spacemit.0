Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C7D352F99
	for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894105; cv=none; b=e6XLela6jS06oVCu1tUSuWCGgt66ghX27NJZPDYcJ1J1tyREXlpNQ1BgwLVzNjGrWgYMh4ENSeNudUoNYu6Ybm5CHjPMuV4gKoSg+eljh0Ugr524cmkLIsgHLklNInpgvrTR104WI+g18St24jva8tv8TtbNGP4sERuAkgE275k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894105; c=relaxed/simple;
	bh=/Wododm6Hj52N73BD32ughfd/z1UEFrBFZydemobFr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BhJQ7QsMvLyuHajYcnoWtVd8wEbX9yL2n41aSw+2WZg8iznvjvpW40Xh7TB+5hpUVkbp2OCoppqUfVaM7+PU/QVaVVqfVnC9W45IuBhlYuYeCWHGDmCSjy4Gt6Jbv+if9ezL8c7URwTTf/LKXxDhsYRtw4+/0JGUKfPOJX00GaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=GX0tA3x1; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="GX0tA3x1"
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E32743FCA1
	for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 14:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1765894095;
	bh=s6OKug5US6pxBUrhttaNzk4ojcTJP4aLJKCdbICH8xs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=GX0tA3x1ep33bOiR4upSIIww/8eMCDLYDr/WzBpUx0W7aKkaHseBq2jMRih0C1pZ/
	 v+BB5E6UkELBsUjkgYQDyxJW1ODlISrZficQg5BnPWElZwx6I9NnnDt0B3K9SAhaQG
	 rFtczIGuDQ5rxYYxjLa8WlritMZY2dKIvcFwinzraeeZkXZfcTZMq2Q+iBH4dtj7W0
	 4xN0m6ZjsIl/Fcf4pIjM/VdicPGpld3JzNjVPT0ur9YCvAW1JYFOEHwxRj+Y9lUhSJ
	 Di9iQ8eLzwm7W39EdHAeXdxT0T1ORcY8cRz2wyWFWwnRbMbf1yNTODb70y/C8QhUyE
	 nGHUhMmjTWwjI0id5ffPWbijUzEN1SBTVjQDWGhS3CXHVlEJRUiWVPHzvxBFA4oiDm
	 vM9PTdxSXfBDwoOE3mDYqP+QK1o//HOn+tsEDkufD5ljPu9rqIxEsvtQU9EK3gE85D
	 juq1XW+teYbsuwfLThdeSq/HT4uPAvn6oFluwVmBgvI1YHTZ29UWbRev+d/Ni19EYj
	 mlaE4MBiD+KsZqtA5fyXN5xR4MsJVSpB5KMsvsMFd6qVPrgNMEVtYBbJU+vzOepnNL
	 YwOmxw/z57VhF7uWatHRn5VXWE64CiL2C9W04+qG2lv5XLvrxG4q+g4RjMDN+AZgWg
	 FPyQVSrQq6Y0bYh4eLHdxzUA=
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-649703f8012so6722870a12.1
        for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 06:08:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765894085; x=1766498885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s6OKug5US6pxBUrhttaNzk4ojcTJP4aLJKCdbICH8xs=;
        b=B4Ke0NorAUtT2LklyGSU3XKIjHKQO0Zw6cde1uiqvme0jg+zvrDCIQo3IbAmPMQc2U
         LV/6NffVaDke5A0kFz792oZ67GkkWpR0gv/pB4pJ2e5/Mbv9HEKJJ1gJPBgYskfFnAcN
         KTIT/5Hl7WHXaMqfdCyiTOTqKQ8Mumi1rj3NxI4BcR2uOQS+YjZYPznilLIUMALVpeb1
         QepYV/zA7hphoP1tvNBdL4P8npzq51qThIorRZT5Z5M1sx9p/PrshMMxE27+nRV1s0Lp
         ZPYbUi6fw0UPaAo2rcaqcqe96sheS1TZQNpZzmESVB+IEqmQ11/gOKCMI3OtIxUdxd5l
         GlpA==
X-Forwarded-Encrypted: i=1; AJvYcCV9oBpBjYW0c/NVtZmbpwClwLZ4iHxY9LQRoBzys95ciG9QHKFJ2aW4ZqfgSpLbJoN928uCn4DrwA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUcZb8lMfhAWyeufgQdOFMqCijguqaDGbL4SQi3UGBktPJnt4V
	MSgrF4/iXzk1a1lP7jEmdtcPI8TxeZ/KF2tPCcOADn7XyFAJvTNxCVD1uCiVTKNaDyqhAKlNA1g
	ie4beBT7pkeQ8aNUxcsKyOHSr93XoGfCGmPof+sXMBzupi92R8edr4lGqdJy1ZUpdVSDpXwmUXR
	Ei
X-Gm-Gg: AY/fxX4dL1cQhrLwW2uyi44tDn9yBkbqoE9sMJUnPmE+95cg7q+56uh/fKTwF4ZEeYb
	Vym0lWPYWvhfcnUg1J0NMJSq1+rsFbxqGmzMwdxEJihKFrsTNeN/kP9X2SAzbXhvdP68lfcFIY5
	bVw10r8GP43XlkZ4yO05xoDGWY1AUaF3H37RmgaZLNBRXsHBtTFHYiz2e2lZUOz1Q+kpsAyVacj
	Psfkfc8Og1wJHmC9w7jEgB5UC2Lj3hfkR0NmSsLYisgvYC2PuMl4r6LxjgbkPbX+vlVoyBEmsPy
	GUyvjwUcXrXyoJ6nujcTbwF/5WuBzQW/fO+G/cjBJG26AQ4h7h8gDIMYUQmjHZDE4bFJ8Y9xZX/
	+WTm0b4oN4Zrg58JFBgFp1E40X+HRpH0yOOkeyVVULLQD8LgeOVWX62t0NfksSY5GkDeKMgou87
	KFDo3fVFLnaBDJlg==
X-Received: by 2002:a17:907:60cf:b0:b7c:f82e:30b with SMTP id a640c23a62f3a-b7d23b1c3ffmr1594363666b.52.1765894084881;
        Tue, 16 Dec 2025 06:08:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtqWjNEWPbxkffOmFNn2OFkrwSQdkzVjA6Bq6rV9Lw/Z0LSQ+mn+A/wq7Eqay9PrsgCg2JGw==
X-Received: by 2002:a17:907:60cf:b0:b7c:f82e:30b with SMTP id a640c23a62f3a-b7d23b1c3ffmr1594361066b.52.1765894084492;
        Tue, 16 Dec 2025 06:08:04 -0800 (PST)
Received: from [192.168.103.125] (dynamic-046-114-006-010.46.114.pool.telefonica.de. [46.114.6.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa51b859sm1698504466b.43.2025.12.16.06.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 06:08:03 -0800 (PST)
Message-ID: <e1383a10-84ac-483c-aca4-7f2b39ccac16@canonical.com>
Date: Tue, 16 Dec 2025 15:08:01 +0100
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: riscv: add SpacemiT X100 CPU compatible
To: Guodong Xu <guodong@riscstar.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 linux-serial@vger.kernel.org
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-1-a0d256c9dc92@riscstar.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20251216-k3-basic-dt-v1-1-a0d256c9dc92@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/25 14:32, Guodong Xu wrote:
> Add compatible string for the SpacemiT X100 (RVA23 compliant) core.
> 
> Link: https://www.spacemit.com/en/spacemit-x100-core/
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

LGTM

Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> ---
>   Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index d733c0bd534fb63ed7c0eada97c42832431f1fc1..cce87092dc7749f49066154d9a256af6c7b6c19f 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -62,6 +62,7 @@ properties:
>                 - sifive,u74
>                 - sifive,u74-mc
>                 - spacemit,x60
> +              - spacemit,x100
>                 - thead,c906
>                 - thead,c908
>                 - thead,c910
> 

