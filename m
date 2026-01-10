Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC42275844
	for <spacemit@lists.linux.dev>; Sat, 10 Jan 2026 05:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768022348; cv=none; b=kL4Vq+J2puD5zexKG/j5AUh8/MlfRFN0G65ztAQKh/QLqmFsEfr/aD6huWWNP+ykxJ0lbpaKlBMvv9W4qOrfPWHVlW/BoOlNQdmQp5udkz11O5GbHFYQ2x2bCc5NL97gM515YVTTvMwyZg8qgRkNeC3utXZxCN9pTue0MVapa6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768022348; c=relaxed/simple;
	bh=2L6MNmGY38hVdp9Ijc+okVTe3kqDNq0YpAih/UfxNDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nTkOQxuVtVg7aK9RslefQuN3Sted7XTOl/Ga1gx5kYlWZKLZVRniyawPUHqHXkNB8UriJ1rQAnd2nJoyH1iZp9W8Bd1uDaOUFHIJoCNf/447P7i1YqUpjEUnJ0fJRVQR/vPJd3Xk6YI/mUp850WFuApwB0tQSl5seU4ixTWMbIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=1S3up+wh; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="1S3up+wh"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-34c3cb504efso3879811a91.2
        for <spacemit@lists.linux.dev>; Fri, 09 Jan 2026 21:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768022346; x=1768627146; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vZa4MSAEGd4aC/jK6JBtGhuF7IGt0ZyoCs3KPie1Vc=;
        b=1S3up+whjkshwQqUhqPDSYK/NFnfkVzbvtLaGXw2Wv22yBVXLyZVFMmntoQt7s95Nk
         ZTt6qfHATvchZvvq7Vg/ZY7si6eIJ1NKd+u+kW3SxuwC2YSSX3rbUkAJDkl97025IZQE
         y6MfQ1s3Ks+DD2Kf5TQeaVtXW/Y5LWaHO39dpshtVmSuqomYWBnd+CL0kYLKd4ZIBY7d
         B0Lvfm17M3w4ujaHcaq0CLlLVC8jAc/ymSDu8KvdnWPSMAUpMx/tfDDbVuS0h3vycwVx
         PicegQ664TuR5ysZONhLv6jMo/36qgIrrtrI55KjMyfuGESxQJc4pDXTxo7xaUnfUR91
         X/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022346; x=1768627146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+vZa4MSAEGd4aC/jK6JBtGhuF7IGt0ZyoCs3KPie1Vc=;
        b=XYUyVavyVSF8+Ya0BvRPNkvbSzo6dCbusngBqHilkQLvIDDizPnA7Ye9lE2g5idGcq
         Pjx7Tk7PLGUTVAocm/pAESHq8Kqe3JbfglPjxWCFufqXfPmZ4zPq8Yiy/+ChqMJ8s3cZ
         dIqzxpjG7AcGf2ov0IckAF/n52h5ybDLs1Y7pcFJYs9eskPUO1fkE0YWyZ9/Q7hO5Isn
         NBVbUd1otJ59xa4OBTdSd3Q1qw4b8az5vnPtTnQFQIujWvBcD8SsEw2mJoEDRLzin61s
         sobvisEaCXe3Tz/j1UNn5TwEPO+T8+d2EF4OfXWx0JtL+p4Qk2pC/GofcaFC82zHPBOa
         DXjA==
X-Forwarded-Encrypted: i=1; AJvYcCX19Y1S6qzDucCjU20jDB9ypvLbH1Hcfi0meluLrIdKGyVrVQkpUq4WI5Uc3d4SJCiqQdfYfgWGxg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3bli+adRP5WI/JtnuD3JLaWgUbmsRmCfS34aqhvqNiUaZsORg
	xpV22j6O9jUEEjTnAI1kAaYCZBDd+plI/8YV4SAnwKHHycDMepLZzyMFKlNHQfv6JIA=
X-Gm-Gg: AY/fxX6q4VpTo7wAkyCbyGQNy9xfmpfRlng3VaK1QaBKx1ageQVdCtRboNZ8Qc+7so4
	SFOKKr9vz6+n07TKrZ+nHRj2whE+n2hwrQnHbrmAy43MJ252+IJSQ/JcFMBiVAnEgmrdoKq78JC
	1CIPtxxPjxf9FxJzg3VuyHpgvFe7F7llNm8eWh9lr5tHcIJ5o68SVlHIP+txPl9EpHmN0G2gyxc
	LfZ0eBHnFf92XFWuiBVWpXObg97Bzth1d0GffHeGUQkhcKmK9eQ+LxSAHFtl9p8lKhRnuzEfjgc
	7uLuW4rwgeupyAyyGi4PPXHxg76saYS/QT/d52U8cTyaQWyepZ/01rLLgz8tEM5gnQV8HYAx7lm
	TozUrnTTFVgZC9IccnYJCd9UTuU9hCby8p0zmoUmlMKMmx27LEVmXLo7uUnJgWXu3I1+Zfo+OqY
	niLJUciL8bxAQL4wl7CeAmT8dealhLrcTTpj8+IA3wIwFD4xhbj4/jsA==
X-Google-Smtp-Source: AGHT+IHbWq9DQ8nx6uG9JGFLdiLuMqyccmdPD516zDG77XGC4jrI6E+jtKCvRSSwQ6vvWdUH3x05HQ==
X-Received: by 2002:a17:902:e549:b0:2a0:be59:10cc with SMTP id d9443c01a7336-2a3ee491b7emr114403405ad.32.1768022346020;
        Fri, 09 Jan 2026 21:19:06 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88cdsm118208265ad.73.2026.01.09.21.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:19:05 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 10 Jan 2026 13:18:13 +0800
Subject: [PATCH v4 01/11] dt-bindings: riscv: add SpacemiT X100 CPU
 compatible
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-k3-basic-dt-v4-1-d492f3a30ffa@riscstar.com>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
In-Reply-To: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
X-Mailer: b4 0.14.3

Add compatible string for the SpacemiT X100 core. [1]

The X100 is a 64-bit RVA23-compliant RISC-V core from SpacemiT. X100
supports the RISC-V vector and hypervisor extensions and all mandatory
extersions as required by the RVA23U64 and RVA23S64 profiles, per the
definition in 'RVA23 Profile, Version 1.0'. [2]

From a microarchieture viewpoint, the X100 features a 4-issue
out-of-order pipeline.

X100 is used in SpacemiT K3 SoC.

Link: https://www.spacemit.com/en/spacemit-x100-core/ [1]
Link: https://docs.riscv.org/reference/profiles/rva23/_attachments/rva23-profile.pdf [2]
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: No change.
v3: Added Acked-by from Krzysztof.
v2: Fixed alphanumeric sorting of compatible strings, put x100 before x60,
     as per Krzysztof's feedback.
    Added reviewed-by from Yixun and Heinrich.
    Updated the commit message to provide more information about X100.
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d733c0bd534f..5feeb2203050 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -61,6 +61,7 @@ properties:
               - sifive,u7
               - sifive,u74
               - sifive,u74-mc
+              - spacemit,x100
               - spacemit,x60
               - thead,c906
               - thead,c908

-- 
2.43.0

