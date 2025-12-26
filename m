Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070AB23EAA5
	for <spacemit@lists.linux.dev>; Fri, 26 Dec 2025 21:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766784534; cv=none; b=EjDIif7XOXZavV/UrqVTzXb5M8lSdSQ90c84Q+LMZa4LE421QSchk9f46fD/XiraB3NBwM+qI+TzMBwQxTqx/NAev4ig/IzUxsP/PHCsa32nO6KxCdDs+KcZWcnzytJjacDPt0rEocm9QOpNgxNNke8Dln6dVrj9YInpFotx1k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766784534; c=relaxed/simple;
	bh=NspC7S3ikTMUwNzaq52BA472WHff+d7fgODKBGfPMtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iO7Zo20Cirj+DOW7ukYBl0veGoXX5BZyDzn2IC1cxjwjXmLYCJ6Q4MswMPo7TEYxBFQpMbhmlBc69zo1A0nDYUWJdm+Dm0cN+ubME7LWMIYxgh3pwZ+XgE7nqihbCzSxI7M2pnOmQ0mZUaytwhnb1miOpzKDiup7H+KPl4YafOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=bgA+9Kfy; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="bgA+9Kfy"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8bc53dae8c2so1141794985a.2
        for <spacemit@lists.linux.dev>; Fri, 26 Dec 2025 13:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766784531; x=1767389331; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nntctK0gEdJs8MBuE2OMh+NNa2bU4c08j9CTg1079CE=;
        b=bgA+9Kfy3ljtJ3K7ZORIBb6IZ3XoLKfEM+qtUmodzFq3egct87SW0r1GhwsVknW56c
         G1SlEv9Q0nqC7w6FGL2kgfh31ektcxqI4jPT6kSJd4qO1TjFy8Rdw3SuLT7LBOb+V18m
         0xT2T2EtP5OjIFGh+G+3q+eQeDLaZTRzY/u+ZV/i64RfhTGB0NO3Q2E2/ZUobZLsR7u5
         SVz1rd94JyuQN7b3T4I8qAKsfwuuKTjalL0hAa6lWfKGCA4F760VZ3s85/rXfyM+5HsC
         NRIcIxQhXWOzLhJieAQfoIUuffYd5gkXh+WTsfgu4VBfcKt2YIe9cthpcc8ROxWoxIwj
         q/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766784531; x=1767389331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nntctK0gEdJs8MBuE2OMh+NNa2bU4c08j9CTg1079CE=;
        b=PvuqoW6sVEWj9qsKmezDLmmifucOCgk6DMfjSYyhT/2knhUW/qxjAkskQh1Ksk3svk
         UJ9TnlU8j1euJvfGAPHH24e3EKqJ32Fa6AbY0YNIgXt20281+LCUwCCXYif/9LPSHhHG
         YTk+U4OuIHWx2OVUBhJA3HRXrcAP806/NfLnyzZd0ymHC4Ar3qW1O6UU3OqrBN8Lon69
         dQ+O2pPDDDgrClH/yFNU+GeD10e0gOveACl5CKWK3+cLClVAAZkEajuKgP7wkUpqGIlW
         Oz+dKib1E3BqVFTTwRSMiD6XQBLmAR3lgOp2KGxlJCdufGhIDgJ3hRPt5mE+Yi/0BPkA
         Izeg==
X-Forwarded-Encrypted: i=1; AJvYcCULKjY8ZBdyXEilJskRZWALbqIRMX/IUyHVevpEW0n3cGjjK2HUmhSOz2dYbjGB8hmrXcOZfYZuyg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh1Zj8dBFv97/Aq8CWs4CGyLZfZp5HyjZdqMdRiDmjZmgyHIdX
	fNA/eVMMRrNKagX4CxxdpT3VaYQyPMYeCrhSfXUgDVxkkPT/p3i+rYyehQEVBAeJd4k=
X-Gm-Gg: AY/fxX6A8+nUmMk2hlkXs5Trxp0EA9K6flXwYTDol/eL8rnyILXIXkt0mTCNBUNG7qi
	3TAWK8m6aFJg0KPHH+BYkHHXmvhz6OpFfyzXUuieKw9hxflrm+2AO9fexZTjzHna29GgKxhAkys
	QldSw1FuuAEIGOw8tFrhQG6y+2JsxUEUzJhvod0vh45zknMOYGNqS+F8fJYVrS5nfNMKH+WHtjy
	Fj+2p2AQ8zNXAEmZNxPfWUQh8vEuIjwPYCpA29nFNm5nZp1U54GHkU8pbAIXTNxqBJHCSDQzmbD
	jnhQTT12OkRXbBO2a0Ztlm7Gm2jD7sbPi6yvkzlS3JYNrqcHR7vS4WBWWISUt/mlXepyIQSsBOZ
	GJEP2YbarYoecNQ+ADY0YMVFIaeu6bKgwswg5SadVgQlI7/Ht3Bi+YJn3uwgMWJaJ7nPe1SPVZ8
	tqSqDh89i+ItiHt5qG5FJJFsUatGKAbU+esLRfQj2O0le0qrtcGRA=
X-Google-Smtp-Source: AGHT+IEy/QOrxe2SQiRFQjJ/+nrpNVPGTV1wSqBMtHRM+j197OQHW+EwApB9rAJn4Nlwz0TrLac2kQ==
X-Received: by 2002:a05:620a:454d:b0:8b1:ed55:e4f0 with SMTP id af79cd13be357-8c08fbc6077mr3782302885a.39.1766784530950;
        Fri, 26 Dec 2025 13:28:50 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973ee08dsm1824350585a.36.2025.12.26.13.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 13:28:50 -0800 (PST)
Message-ID: <fc719e92-10bc-455f-b402-c93bdbf878cf@riscstar.com>
Date: Fri, 26 Dec 2025 15:28:47 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/13] dt-bindings: riscv: Add Supm extension
 description
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
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley
 <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-serial@vger.kernel.org
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-11-3af3f3cd0f8a@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-11-3af3f3cd0f8a@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/25 7:04 AM, Guodong Xu wrote:
> Add description for the Supm extension. Supm indicates support for pointer
> masking in user mode. Supm is mandatory for RVA23S64.
> 
> The Supm extension is ratified in commit d70011dde6c2 ("Update to ratified
> state") of riscv-j-extension.
> 
> Supm depends on either Smnpm or Ssnpm, so add a schema check to enforce
> this dependency.

I have the same general question on this, about whether it's really
necessary for the DT binding to enforce these requirements.  The
RISC-V specifications are what truly defines their meaning, so I
don't really see why the DT framework should need to enforce them.
(That said, I'm sure there are other cases where DT enforces things
it shouldn't have to.)


And now, having looked at these added binding definitions (in patches
07 through 11 in this series), I wonder what exactly is required for
them to be accepted.  For the most part these seem to just be defining
how the extensions specified for RISC-V are to be expressed in
DT files.  It seems to be a fairly straightforward copy from the
ratified specification(s) to the YAML format.

Who need to sign off on it?  Conor?  Paul?  DT maintainers?

Thanks.

					-Alex

> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: New patch.
> ---
>   Documentation/devicetree/bindings/riscv/extensions.yaml | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 1066b7e65dab89704dbac449db4aa5605c95b9d3..4997f533b2c0defad88fd59413a6885b5b9e109a 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -267,6 +267,12 @@ properties:
>               ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
>               ("Updated to ratified state.")
>   
> +        - const: supm
> +          description: |
> +            The standard Supm extension for pointer masking support in user
> +            mode as ratified at commit d70011dde6c2 ("Update to ratified state")
> +            of riscv-j-extension.
> +
>           - const: svade
>             description: |
>               The standard Svade supervisor-level extension for SW-managed PTE A/D
> @@ -892,6 +898,16 @@ properties:
>                   const: shvstvecd
>               - contains:
>                   const: ssstateen
> +      # Supm depends on either Smnpm or Ssnpm
> +      - if:
> +          contains:
> +            const: supm
> +        then:
> +          anyOf:
> +            - contains:
> +                const: smnpm
> +            - contains:
> +                const: ssnpm
>         # Zcb depends on Zca
>         - if:
>             contains:
> 

