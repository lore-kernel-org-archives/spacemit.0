Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CA330F554
	for <spacemit@lists.linux.dev>; Fri, 26 Dec 2025 21:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766784524; cv=none; b=PiV9orFcwdRooGpuXt2ehz6SU5cqPHL8HyYxC/x/HMyoRJZO2CwuxqKGWVDtgZZmk0o4ry69Tq/ikcBHrs45MfwFLb39lnma50fTKR8B5HGQiPnPG6uEcMGlKp1E28ZBECtuahDu37CG5t9+xn85EztEG8DEYK3hYw6VGE+o0RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766784524; c=relaxed/simple;
	bh=ymKjegIEukCZBaGND8eURmKdlGa4343mvcuoS+wMnww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n7bNeQTToSRFHSNJvQfw2FVZoxGuj+CeDMzJ517xl4dP2Re8mob0HSS2ShnbTkm3W+MXAD5yIbCNQIUE/NVzWdQ0naYSvZz7xUfM2fILYSqQGJNRSunIchO3CYtHFZPY9/8G3qlO9VuP2Mc04sGJ6DSl1OgHc3k85KkrOfGNgfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=m9S7km3m; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="m9S7km3m"
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8bb6a27d390so480566685a.3
        for <spacemit@lists.linux.dev>; Fri, 26 Dec 2025 13:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766784520; x=1767389320; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GPFEcRLa6bpej+0ne5q5GKQT+KIJ6FmG8KY9UAp494Q=;
        b=m9S7km3mLGqAloLlAvgf7Ibd1Ynmz6qhaCr8xRQIYNqrSW1rzSYF7JJZ8su6McSUzu
         hI76TWaM9rtFAeMqpVIzQ+YIOtOs2K8EgGkMD2MyYmtcCy2PBFlKIRXYGE2SGSeLJ+tM
         6W+4bibprinW1w20lJljv4dR/+vw4yXxWWzN8w1jWw6rjg2bFAKc1PskuSD0Z5m9McqS
         suJ79Lb3V8t3J7GaxdTw6gF6f0f2HoThBlJyWVJelxN+gQRkKuzisXxzKQvrh1jRxarO
         l415ovdR9HFNb6DDqVGvuipBzSnRjKVwZ2QSKEdUSHLoLSqtTK9woQOzRXsrI9boMcr+
         zMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766784520; x=1767389320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPFEcRLa6bpej+0ne5q5GKQT+KIJ6FmG8KY9UAp494Q=;
        b=F/DTjVE4/1d20O9c7eUa0lZ0iJcQ9KMJPWGOmTyF12qlkZxbCeC9HD73aMLTDSkGQI
         wx0SPpUoAMOM8hwf3hY2Dfzx06RxJrhZZ1cmMCfXl1SvJEVNDGyIaMYIpDd7a8WnZYQY
         oEFwDrbxYkJfrFT7tzw75k+4w2D/xVWrjBc/MfM+8kEkSVdN8dLzU58QaaeY7GF67DQ3
         kMoYbX1p2WYawz9IXVpFcw4kLTLzF91q+lCxEETmz1SYt6wWYBbo/OaTsxkRVBvjG/Vl
         CxZLOb8JDOLZ1loDaPIvfCXfEXQWjF6qHY6y53VuAV3voOk5xB5fL/OYZk/YpAyPenXu
         3C2A==
X-Forwarded-Encrypted: i=1; AJvYcCXjEoZBMQ6CJhnDX2hVemxTCMv+zJyoItIVoTEd+e0hAFqioi6NlKg/WJTtSKnElaQDNcvwGIYrbA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGR8Tt3Ifl8ilv3+qYtAXKrtoL0Jdz2NrowWyldckeOlYZGLT0
	AQO9bMlBRW2hi36yfSJUKhlh/fa60L5tiHD6OPmoLdf1Q9tcS0kI12XQr32ZT9gNj4Y=
X-Gm-Gg: AY/fxX7EORtcNr6wE9Wodlz0V0ijzF4XXKWXsyrqAjOZX/+bh8v7oRDwbyzZimv05n0
	LAC1Ij2XyrMu3uoNi71aLACt4EJ6gT4HH7eHQlgFKxty+HwhyK/2Aov54H2OGzLFgSUkCpsvmfF
	JpZ6e6Cv0kWjleKm2dbY9l9JlvtzMHwGFCbeMAEl9tjXcud3Th5amS6UxGpPxyuj1CK6F7ePlfw
	xk7dD0B8yuRKRRh1WINvyjjpUaY9CzC5OoejJUkBTtktxyMUbsIl7FYbId+7xF3v1kNgQ0Vw/O9
	vqZ3RlPvQ6QEDK7eqcChheufcktd3ibsFP8TPk+QifGR9q35U7QjWjpS5HBTHfi7hR3h15MZv/u
	zDXTcby+/xijezrgNC9InEAEsTv3O5EFi2ZzL870/Oe8EkA3XONIGKXydx9t+PQ1XHJyJNq6Phk
	A3wzL3+pwnUGL52LbGSyKdrqqnZEGuTLihs4SIO/6+QwFbhp2MDJQ=
X-Google-Smtp-Source: AGHT+IHxk83GWhcfAeMb/H9cfylA1VgJA5ej5ei+26m7wuK7chT230ft6Z8P14rw6S5mJmDD/1J6GA==
X-Received: by 2002:a05:620a:2699:b0:892:7dd2:9f0f with SMTP id af79cd13be357-8c08fbde5b5mr3491225285a.19.1766784520424;
        Fri, 26 Dec 2025 13:28:40 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7d5f4sm176833206d6.40.2025.12.26.13.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 13:28:40 -0800 (PST)
Message-ID: <6925aa57-874c-479f-9f5b-f0fd6ede685b@riscstar.com>
Date: Fri, 26 Dec 2025 15:28:38 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] dt-bindings: riscv: Add Ssccptr, Sscounterenw,
 Sstvala, Sstvecd, Ssu64xl
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
 <20251222-k3-basic-dt-v2-9-3af3f3cd0f8a@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-9-3af3f3cd0f8a@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/25 7:04 AM, Guodong Xu wrote:
> Add descriptions for five new extensions: Ssccptr, Sscounterenw, Sstvala,
> Sstvecd, and Ssu64xl. These extensions are ratified in RISC-V Profiles
> Version 1.0 (commit b1d806605f87 "Updated to ratified state.").
> 
> They are introduced as new extension names for existing features and
> regulate implementation details for RISC-V Profile compliance. According
> to RISC-V Profiles Version 1.0 and RVA23 Profiles Version 1.0, their
> requirement status are:
> 
>   - Ssccptr: Mandatory in RVA20S64, RVA22S64, RVA23S64
>   - Sscounterenw: Mandatory in RVA22S64, RVA23S64
>   - Sstvala: Mandatory in RVA20S64, RVA22S64, RVA23S64
>   - Sstvecd: Mandatory in RVA20S64, RVA22S64, RVA23S64
>   - Ssu64xl: Optional in RVA20S64, RVA22S64; Mandatory in RVA23S64

Again, I did not verify your statements about where these are
optional and mandatory, but I assume they're correct.

> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: New patch.
> ---
>   .../devicetree/bindings/riscv/extensions.yaml      | 32 ++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index a6b9d7e3edf86ecfb117ba72e295ef097bdc9831..ed7a88c0ab3b7dc7ad4a4d2fd300d6fb33ef050c 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -160,12 +160,26 @@ properties:
>               behavioural changes to interrupts as frozen at commit ccbddab
>               ("Merge pull request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
>   
> +        - const: ssccptr
> +          description: |
> +            The standard Ssccptr extension for main memory (cacheability and
> +            coherence) hardware page-table reads, as ratified in RISC-V
> +            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
> +            ratified state.")
> +
>           - const: sscofpmf
>             description: |
>               The standard Sscofpmf supervisor-level extension for count overflow
>               and mode-based filtering as ratified at commit 01d1df0 ("Add ability
>               to manually trigger workflow. (#2)") of riscv-count-overflow.
>   
> +        - const: sscounterenw
> +          description: |
> +            The standard Sscounterenw extension for support writable enables
> +            in scounteren for any supported counter, as ratified in RISC-V
> +            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
> +            ratified state.")

Maybe you should just copy the text from the RVA23 specification
for all of these.  So something like:

   For any hpmcounter that is not read-only zero, the corresponding
   bit in scounteren must be writable.  This was ratified in the
   RISC-V Profiles specification version 1.0, with commit ...

> +
>           - const: ssnpm
>             description: |
>               The standard Ssnpm extension for next-mode pointer masking as
> @@ -178,6 +192,24 @@ properties:
>               ratified at commit 3f9ed34 ("Add ability to manually trigger
>               workflow. (#2)") of riscv-time-compare.
>   
> +        - const: sstvala
> +          description: |
> +            The standard Sstvala extension for stval provides all needed values
> +            as ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
> +            ("Updated to ratified state.")

Or alternative to the full text in the spec, you could copy over
the abbreviated description listed in the glossary at the end
instead.  Something like:

   stval provides all needed values.  This was ratified in...

					-Alex

> +
> +        - const: sstvecd
> +          description: |
> +            The standard Sstvecd extension for stvec supports Direct mode as
> +            ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
> +            ("Updated to ratified state.")
> +
> +        - const: ssu64xl
> +          description: |
> +            The standard Ssu64xl extension for UXLEN=64 must be supported, as
> +            ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
> +            ("Updated to ratified state.")
> +
>           - const: svade
>             description: |
>               The standard Svade supervisor-level extension for SW-managed PTE A/D
> 

