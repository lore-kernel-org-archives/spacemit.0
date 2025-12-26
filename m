Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A242E30E0E7
	for <spacemit@lists.linux.dev>; Fri, 26 Dec 2025 21:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766784528; cv=none; b=LbP578PpVuKuaqSo+eJ8wxh2IYBiALRNbcKvazTQNRKB2botDASPh/M9DkBsfamoXGcnVsk+OZdFMQ3shYsfEiQnUx1SNyiK+O56P7q5YCduo3yyv+51WAHI4IULwjtuykC+u8Z8+PEWUwU6JBhmAoPVXY1Y7gbdyPrX6pYxG8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766784528; c=relaxed/simple;
	bh=MoGD8gTAjdwFmRSWsjhCUfDSUgAkXm/+wEdjRDtCzFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yiar3wJ9Z/6VlGCEZhrG+x2TaM5ehY/IpyC/YfeYq9VXINB6Y7dAXxcmZbVOlvTi2rLgBsPWx1Cu97oQTk8wsNuSWlC3/PqwhcOlpB38suQzI8tsUUZtAc4jg94DC8uBhNSQiWVnAqsDQPdr3Zg/CgUb5cmMmcYBAB8gaQ9Gbrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=zxJTl5ic; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="zxJTl5ic"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ee257e56aaso73249171cf.0
        for <spacemit@lists.linux.dev>; Fri, 26 Dec 2025 13:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766784525; x=1767389325; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dtRfqPPDGuvZUTAw6kj7CgPqAXEhsP7aAJnNHxSu2A8=;
        b=zxJTl5icKA57W6YJ/bg6XqobyDd0NXZOe1erMuwEZGE/wFMOgf7iBG1sXWn65GgooY
         AWs0swEzG51AdgSzR/ecANiaszzFt45JFgtm/0tw+hMweLOpTTstLe5tFMLnc59qIOuA
         lKcbyCDM1twJkoD7uuAwwa2VlJohQzuc379AEzndQFQnR7gw4kdPenEGHnMuvQaDPTbZ
         CUSEr+M9s5zdP4JNgf6GlifTQhvMz6nYyIl1CaySbHN5CEcoqdLuUtY02Vp7DXczyiJq
         CTCxgBTcVSmT0t+rUa4SnVyc67emy3Axo6o+XQlAhhSz8WCKjK9rbcBw650Wp3CykcvM
         trQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766784525; x=1767389325;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtRfqPPDGuvZUTAw6kj7CgPqAXEhsP7aAJnNHxSu2A8=;
        b=P0KGRp2TgsvBS7wvxNc9JKfjslM/XiaAMYwkcxrmiZNNLV5RItgNWRhB5ga+6QPvrA
         7kWpnNe+QQpH8pJWUJGLQ1EGVUdsCHqI5G4BPBcWkWKNwLh1KdALwl/uWKI1oMcCYvF8
         s4ic+H5OaFeo9Ia0YsC6LGK/B4pgbBfdsEvpFLiOApj0+siBawSI8q/n5M2KWtYAsfWS
         /guFiWSy4bg+p4iuRwSdliHn0V5aIUtngXJOdHevtrT5HDOrdFEtoJOR2Qmffu6KpLhL
         FpLKAjZkf2WnlTSAxXmvdhLHdSyoPOopCI5FGJdwfKOh/8Pbrbo6GDfDgvAp9jn2+mLs
         XGKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfQxu6N+xuXZ+mB4FXNx7bgsuq8lthybbyyxrldkozpDawWPd7dci0G2jT7EhDvqGHwQVSv8Rxog==@lists.linux.dev
X-Gm-Message-State: AOJu0Yymg/SP77kcNJTOcSOyoewmGKILFEE0iXB97I8lLAmuxogbNBzN
	jeRMClydZBQCt4MRsBTwFjQE86GPXdOyJl3+SuqvZRCy+CCgP+H+K6lA6L7sT8OHbTk=
X-Gm-Gg: AY/fxX6MQs4n63WLOgGXMx23IZCeDEBACRQFSTmsoICkrcU6MXIJNwPANc7/mLaviBL
	bZ2EBkMlLbMxtS/4NB5Pvl/eY+0Feqn+9qdc4DDI69D+eU1RMjaZVCmqnue29+VZYuETnv3SPVj
	fj9bqOjtOHCp1qJ5/pH8asUQ5jLBaNhNBsjRt5nKmqn2E+91ZIj7KbYUpATlvEKzCxlBUKlX0kF
	5jsejPCsmig6yaegYiZN6nX1iYUq+JTQTYqX+LDHOpzbjA2ozoQHtQ7NEIRe1LjIbxSr2n1oedv
	NMtRhED7ywmhrA3AmUrGTXCrDVdbzH/depvLuXvHitPJXzUcWr7eSKQlxRmn36IP99CLQFjccRU
	jrvPN6YqKyYo2ZOpE2vc3BWnVnYXzJs2IuOYg2y5GhEU+FErpVywQC9qF4VZEnMK/pOqyzF2fZa
	TFB4cD+N3LunwrAoiTsCgNCoQQROsFtZkdrjv06lnkI1JsTwNI0Kjk1ykUOYOr0g==
X-Google-Smtp-Source: AGHT+IEgQaXtB6pefcXFw8ZLO2uqzZJ5RfQKofkgNYUG4z74++kdJEHCFun2ZDS/ec+O2+xR1vyGRQ==
X-Received: by 2002:ac8:7fd6:0:b0:4f3:4b53:a914 with SMTP id d75a77b69052e-4f35f3a051dmr439171691cf.9.1766784525385;
        Fri, 26 Dec 2025 13:28:45 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7d5f4sm176833206d6.40.2025.12.26.13.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 13:28:45 -0800 (PST)
Message-ID: <0253c25d-f5fd-46f1-b4d3-ec56909d5eac@riscstar.com>
Date: Fri, 26 Dec 2025 15:28:43 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/13] dt-bindings: riscv: Add Sha and its comprised
 extensions
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
 <20251222-k3-basic-dt-v2-10-3af3f3cd0f8a@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-10-3af3f3cd0f8a@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/25 7:04 AM, Guodong Xu wrote:
> Add descriptions for the Sha extension and the seven extensions it
> comprises: Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala, Shvstvecd,
> and Ssstateen.
> 
> Sha is ratified in the RVA23 Profiles Version 1.0 (commit 0273f3c921b6
> "rva23/rvb23 ratified") as a new profile-defined extension that captures
> the full set of features that are mandated to be supported along with
> the H extension.
> 
> Extensions Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala, Shvstvecd,
> and Ssstateen are ratified in the RISC-V Profiles Version 1.0 (commit
> b1d806605f87 "Updated to ratified state").
> 
> The requirement status for Sha and its comprised extension in RISC-V
> Profiles are:
>   - Sha: Mandatory in RVA23S64
>   - H: Optional in RVA22S64; Mandatory in RVA23S64
>   - Shcounterenw: Optional in RVA22S64; Mandatory in RVA23S64
>   - Shgatpa: Optional in RVA22S64; Mandatory in RVA23S64
>   - Shtvala: Optional in RVA22S64; Mandatory in RVA23S64
>   - Shvsatpa: Optional in RVA22S64; Mandatory in RVA23S64
>   - Shvstvala: Optional in RVA22S64; Mandatory in RVA23S64
>   - Shvstvecd: Optional in RVA22S64; Mandatory in RVA23S64
>   - Ssstateen: Optional in RVA22S64; Mandatory in RVA23S64
> 
> Add schema checks to enforce that Sha implies the presence of all its
> comprised extensions.

Like patch 7 in your series, I *think* what you're doing
in trying to imply the presence of these other extensions
is actually requiring all those extensions to be present
*in addition* to just "Sha".  I don't think that's what
we want.

					-Alex

> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: New patch.
> ---
>   .../devicetree/bindings/riscv/extensions.yaml      | 79 ++++++++++++++++++++++
>   1 file changed, 79 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index ed7a88c0ab3b7dc7ad4a4d2fd300d6fb33ef050c..1066b7e65dab89704dbac449db4aa5605c95b9d3 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -128,6 +128,57 @@ properties:
>               version of the privileged ISA specification.
>   
>           # multi-letter extensions, sorted alphanumerically
> +        - const: sha
> +          description: |
> +            The standard Sha extension for augmented hypervisor extension as
> +            ratified in RVA23 Profiles Version 1.0, with commit 0273f3c921b6
> +            ("rva23/rvb23 ratified").
> +
> +            Sha captures the full set of features that are mandated to be
> +            supported along with the H extension. Sha comprises the following
> +            extensions: H, Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala,
> +            Shvstvecd, and Ssstateen.
> +
> +        - const: shcounterenw
> +          description: |
> +            The standard Shcounterenw extension for support writable enables
> +            in hcounteren for any supported counter, as ratified in RISC-V
> +            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
> +            ratified state.")
> +
> +        - const: shgatpa
> +          description: |
> +            The standard Shgatpa extension indicates that for each supported
> +            virtual memory scheme SvNN supported in satp, the corresponding
> +            hgatp SvNNx4 mode must be supported. The hgatp mode Bare must
> +            also be supported. It is ratified in RISC-V Profiles Version 1.0,
> +            with commit b1d806605f87 ("Updated to ratified state.")
> +
> +        - const: shtvala
> +          description: |
> +            The standard Shtvala extension for htval be written with the
> +            faulting guest physical address in all circumstances permitted by
> +            the ISA. It is ratified in RISC-V Profiles Version 1.0, with
> +            commit b1d806605f87 ("Updated to ratified state.")
> +
> +        - const: shvsatpa
> +          description: |
> +            The standard Shvsatpa extension for vsatp supporting all translation
> +            modes supported in satp, as ratified in RISC-V Profiles Version 1.0,
> +            with commit b1d806605f87 ("Updated to ratified state.")
> +
> +        - const: shvstvala
> +          description: |
> +            The standard Shvstvala extension for vstval provides all needed
> +            values as ratified in RISC-V Profiles Version 1.0, with commit
> +            b1d806605f87 ("Updated to ratified state.")
> +
> +        - const: shvstvecd
> +          description: |
> +            The standard Shvstvecd extension for vstvec supporting Direct mode,
> +            as ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
> +            ("Updated to ratified state.")
> +
>           - const: smaia
>             description: |
>               The standard Smaia supervisor-level extension for the advanced
> @@ -186,6 +237,12 @@ properties:
>               ratified at commit d70011dde6c2 ("Update to ratified state")
>               of riscv-j-extension.
>   
> +        - const: ssstateen
> +          description: |
> +            The standard Ssstateen extension for supervisor-mode view of the
> +            state-enable extension, as ratified in RISC-V Profiles Version 1.0,
> +            with commit b1d806605f87 ("Updated to ratified state.")
> +
>           - const: sstc
>             description: |
>               The standard Sstc supervisor-level extension for time compare as
> @@ -813,6 +870,28 @@ properties:
>                   const: zbb
>               - contains:
>                   const: zbs
> +      # sha comprises the following extensions
> +      - if:
> +          contains:
> +            const: sha
> +        then:
> +          allOf:
> +            - contains:
> +                const: h
> +            - contains:
> +                const: shcounterenw
> +            - contains:
> +                const: shgatpa
> +            - contains:
> +                const: shtvala
> +            - contains:
> +                const: shvsatpa
> +            - contains:
> +                const: shvstvala
> +            - contains:
> +                const: shvstvecd
> +            - contains:
> +                const: ssstateen
>         # Zcb depends on Zca
>         - if:
>             contains:
> 

