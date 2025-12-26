Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F315F278E63
	for <spacemit@lists.linux.dev>; Fri, 26 Dec 2025 21:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766784517; cv=none; b=jqCn/i+RW7MmQtagoESNfIc2THfeLJT74J0Hydl6ubnN7BH/PWdTPlE2ZeEoriHg9U0QIC8+6SL65mrSoED9kC7B5jmS0tY9BdzA/phs1czsK3a/x060YV3iNTMhocRL9WAtJ73ARGP+Uurl/qeBRbt066Dzyec2X+JHEIpc0gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766784517; c=relaxed/simple;
	bh=ZhGFWm8Y7M3qzky9yCK/bA9/qroETuciVky1Ja9nmpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uKfkjFn0gGXOjRCKUBxWNL0G5773we7RESyShcjlRgLdY0G1knciqfgKwKICyVWjiAIMqa4m2lom9eUDG40IBu87VoVs14AfQV6YNIpKZHVaVnujzu37yMoylRdCacBstJqKSryCtRE6+S/yMrBch4kWUOHqKbVfBkMX8rm6h1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=vpnNDrNt; arc=none smtp.client-ip=209.85.219.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="vpnNDrNt"
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-88a2d21427dso77371516d6.3
        for <spacemit@lists.linux.dev>; Fri, 26 Dec 2025 13:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766784515; x=1767389315; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fm5dxyjoGTgLB5EfhliAJ+8GZyHW/7sdxpOXkZhyc4Q=;
        b=vpnNDrNtgWuWW22wbkLqTkrtr4Ms9+ZxzdevD2w1DR5zRcXQyry9LsiUgKhkGy58we
         C3tZdLSofHrfeGyizvgqB/NDsZhQdXgHJuUc6RlonRe+kAvU88Gfd1Chutk5+uqBoQM5
         43Iwkdct/o5Q/5tCS1TmwhX7mX/ZwNpzGMsopflAZvy5gz1Dr9oVJlImCEe3KO77L/UO
         2PpglwDTE6Gl4A7lrMkZwiFtyYF5PIiHIPw3GK9TTJllX3bDQz5XEQUduqqUa8BTx5Tj
         nCv3AOxxjT9M6XrT/JLomJfavwcunaQyOn6GKWd3MamZyJRobhrKbD4IMqPQ9Qjs8wNY
         fsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766784515; x=1767389315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fm5dxyjoGTgLB5EfhliAJ+8GZyHW/7sdxpOXkZhyc4Q=;
        b=E4Ct3vWGbE5PhR7i9ld4XYBBXK0Nbfz/sr7qpWxba7XSRVelw2gXxXCZNXw3JjoL3D
         AkReFS3P5pSF4DoXMRME5Uxj/WbLRQts3qgwFSTAKGurL6coEtfyLBVL8GrE6IBBmEqI
         OGthoLw3X6ri7CtcJEqa7qw3uoHz9TuW4UUiWs/8QG77jTap1gdoZuG2rB7wEziCUhDA
         i4sE69as1UDXchRjL542Sk8HD7HLe3Tba11A6OSM9UQRIT33vjmf1JsX+wS7N7+2amcb
         /iGR51IyyxtDoNODhh+NN2sd5trQZInKxZEOBMgV9CFEhC+Sa6zWcr3fMLlVGXOL9mtK
         g1ng==
X-Forwarded-Encrypted: i=1; AJvYcCVRAPjwyfrUmLGNnkQUSLd1BxXUZXLw7SzbEKk+0ZzJgiUrahAwhPg0cZPBWN827dW7Bq+mJr/zuA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp2jhCDa5AzYQrGF7HkIGyKZ9Rj1KTTiVhHAXYswHCELDy4t3e
	D+AI2/uYerW9qzj8EKrQsXsy8nyqjxhEluLlvsv4Iffe7MjR2IFDtRSWQH8EZ7Vtjd0=
X-Gm-Gg: AY/fxX4UjA/A2O4D/Eh/mWJlSjoCr5HROly+m/AuDRVxgWragX+tiT6ld1wdj0UDBh+
	pI50yLSfNpZcE11KbR4Wa3nYDYyzGTt76cE3yWZPCsFuCCdoRgfyfDhD6XWyoj1ElRyPxddCPYP
	KOo61a8lzwL6TdI3zft0vX8GZeeJdlVeq1Qbi2OVgfU7CycmsNL+h1neErhpuxFoFg9brccnjKv
	sJbc54OIc/hgwS0MtDu5r7sz1G5elu234ImPrShU8r5HNyIXRH7if7L0IQodwSCJ2dgkTzPvoRp
	Ruj2TYTI8DoHnhXMoVxlcrY7OmzPgjP2jEriQN3wBvuZWeM6QNCR0LlR+S0n3hJkBOpzrrREu/b
	gmRjE28Hc3Iy0LcvdFi6xEjQUp+GZD8JS88eqQZQY0cClOomvblkagfwEVRrXhK4agBdnyCsG6K
	IRcGSvv8NeReXLODAx99WtISZhZVr/CLO4TrQiF+2kq/c2iqoVw/s=
X-Google-Smtp-Source: AGHT+IHacwFIf7+7Gu6DCHAGNcJqj4mIg/TsHnBOgw2K659NvhFpRoQ/eMLaH970LQj3miK0Jz/+jQ==
X-Received: by 2002:a05:6214:1403:b0:88a:2578:9fa9 with SMTP id 6a1803df08f44-88d84528e20mr297151096d6.2.1766784514736;
        Fri, 26 Dec 2025 13:28:34 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7d5f4sm176833206d6.40.2025.12.26.13.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 13:28:34 -0800 (PST)
Message-ID: <8851c155-300a-4241-a5be-5163ba54e47c@riscstar.com>
Date: Fri, 26 Dec 2025 15:28:32 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/13] dt-bindings: riscv: Add descriptions for Za64rs,
 Ziccamoa, Ziccif, and Zicclsm
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
 <20251222-k3-basic-dt-v2-8-3af3f3cd0f8a@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-8-3af3f3cd0f8a@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/25 7:04 AM, Guodong Xu wrote:
> Add descriptions for four extensions: Za64rs, Ziccamoa, Ziccif, and
> Zicclsm. These extensions are ratified in RISC-V Profiles Version 1.0
> (commit b1d806605f87 "Updated to ratified state.").

I think stating the RISC-V profiles commit ID here (in the commit 
header) is good.

I do *not* think it's necessary to include it in the descriptions
for the extensions, below, but I seem to be late to the party in
expressing this opinion...

That commit ID is related to this repository:
   https://github.com/riscv/riscv-profiles.git

I have a few other comments below but generally I think what you
did looks good.  I have one overall question though.

> They are introduced as new extension names for existing features and
> regulate implementation details for RISC-V Profile compliance. According
> to RISC-V Profiles Version 1.0 and RVA23 Profiles Version 1.0, they are
> mandatory for the following profiles:
> 
>   - za64rs: Mandatory in RVA22U64, RVA23U64
>   - ziccamoa: Mandatory in RVA20U64, RVA22U64, RVA23U64
>   - ziccif: Mandatory in RVA20U64, RVA22U64, RVA23U64
>   - zicclsm: Mandatory in RVA20U64, RVA22U64, RVA23U64

I did not verify your statements about where these are
optional and mandatory, but I assume they're correct.

> Since Ziccamoa depends on the 'A' extension, add a schema check to
> enforce this dependency.

All of these extensions are related to atomic operations, right?
Don't *all* of them (not just Ziccamoa) depend on the A extension?
Furthermore, the A extension is already mandated by RVA23U64, so
is it really necessary to add this logic?


> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: New patch.
> ---
>   .../devicetree/bindings/riscv/extensions.yaml      | 34 ++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 385e1deb23996d294e7662693f1257f910a6e129..a6b9d7e3edf86ecfb117ba72e295ef097bdc9831 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -237,6 +237,12 @@ properties:
>               as ratified at commit 4a69197e5617 ("Update to ratified state") of
>               riscv-svvptc.
>   
> +        - const: za64rs
> +          description:
> +            The standard Za64rs extension for reservation set size of at most
> +            64 bytes, as ratified in RISC-V Profiles Version 1.0, with commit
> +            b1d806605f87 ("Updated to ratified state.")

The more complete description says:

     Reservation sets are contiguous, naturally aligned, and a maximum
     of 64 bytes.

But as I read on (below) I suppose using the more succinct description
from the glossary might be best, forcing people who care to go look
at the reference documents.

> +
>           - const: zaamo
>             description: |
>               The standard Zaamo extension for atomic memory operations as
> @@ -378,6 +384,27 @@ properties:
>               in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
>               riscv-isa-manual.
>   
> +        - const: ziccamoa
> +          description:
> +            The standard Ziccamoa extension for main memory (cacheability and
> +            coherence) must support all atomics in A, as ratified in RISC-V
> +            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
> +            ratified state.")

Similar comment here (but also with a similar caveat):

   Main memory regions with both the cacheability and coherence PMAs
   must support all atomics in A.

And I might say "the A extension", but maybe that's a bad idea.

> +
> +        - const: ziccif
> +          description:
> +            The standard Ziccif extension for main memory (cacheability and
> +            coherence) instruction fetch atomicity, as ratified in RISC-V
> +            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
> +            ratified state.")
> +
> +        - const: zicclsm
> +          description:
> +            The standard Zicclsm extension for main memory (cacheability and
> +            coherence) must support misaligned loads and stores, as ratified
> +            in RISC-V Profiles Version 1.0, with commit b1d806605f87 ("Updated
> +            to ratified state.")
> +
>           - const: ziccrse
>             description:
>               The standard Ziccrse extension which provides forward progress
> @@ -795,6 +822,13 @@ properties:
>           then:
>             contains:
>               const: f
> +      # Ziccamoa depends on A

Maybe more than just depends on the A extension.

					-Alex

> +      - if:
> +          contains:
> +            const: ziccamoa
> +        then:
> +          contains:
> +            const: a
>         # Zvfbfmin depends on V or Zve32f
>         - if:
>             contains:
> 

