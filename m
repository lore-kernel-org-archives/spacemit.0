Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F8B2EFD9E
	for <spacemit@lists.linux.dev>; Thu, 15 Jan 2026 06:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459939; cv=none; b=W0h/cuEOPRp93PeVc3hchc4SH0tBH3+O6a9XUfdHNAy977tyvwaQpvQdIg1jzyBCUs9R6eqREMl8M0W1TtknZu2FVXr9HPUHf3MDGg21zQL6rOKZVdcp6dNxlmTosnclknn2FCUONKuwO/0sBbuOYDzvnkNV2WgYWJbGGjGWdUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459939; c=relaxed/simple;
	bh=ndCk7OisaRpWQIEmEK6Y89WQLECntbmXGUxlUurEFAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MnMyjC3ti9Lx1mmY90ET3oknGYKcTsujf3s21xFfNxTdRbx9ZvKLGrzxku2qzeUAmm71MdVYVqmxH1U0PlqfkBmz2FEjq+/GhxOwW5HkH2Klm8lfUIVpeZepfsUkx6mzkJZy98r2S19weGF4PFw9shCjLg7/4+6ddO3I6D0c1Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Sy5GAI9M; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Sy5GAI9M"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a1388cdac3so3596915ad.0
        for <spacemit@lists.linux.dev>; Wed, 14 Jan 2026 22:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768459933; x=1769064733; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBZ/ScCVDVjRB+myzZeML8bLD+7O2F+m5AwnN8MdY5M=;
        b=Sy5GAI9M8hfXtGbB2XAkPrq3HN1YD8TJTeiT8pylpfDTZ8MduJsMD0p/e50eZs+H1I
         Dn9ZuBVM9OkJlCx4W6Yj19+xA+n51ootCqwkQ3JhyJfNXtz6/oXIQGAYzjotvKfFtTIz
         f7I8LNoSqp8iK1HEiQHpjGBeC8xegO3TtFAFLTdvGjeucwQPem+OmqUeWG6R3lXHxh26
         kONadfF6HpwuORLV1BL0i8PiwCk/OxVRdUxNiT37ODLjg9pbjE0aTb9yAADiJGEvnRiH
         OoU54oaQIv64yRYT6CFv/jQ/G0T0SW0XnKixZ7/Gi61RbQr9/90gfuW4G3GWEOA0ap0S
         BeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459933; x=1769064733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yBZ/ScCVDVjRB+myzZeML8bLD+7O2F+m5AwnN8MdY5M=;
        b=T6tZv0oxZ2U4Qr0O9FC1d+FPXK7t2FVQcI4y9plnBGrPVzYnyOqfIgrJogXXtt65Ti
         cpIrsJ5ia2w0ITzDMzgsfhGFOyv0p7dANlqNOa0PYyOdYjFh07XagWH1rbuu1evYPosb
         20zixp/3wU6CJCuO3hC+m0I5iMXa1cAVNPZ6B8jhg0BQnQtYzgag7Eqhd60BUvxS+IxI
         Ih0kKFZUIMatMElJZlVDQ9X0uFa5Z2nH6O5UjAS9dwSIVkKOuriqalKZWdz1gUZ9PjO8
         ND8umcH1smp1mochkTJfit0hjYp7cosRRKSAr0nMcHZfS5GD/db5ADAFE3xwhEJ2NT50
         2/ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8pd9eTz8kk2qyAV2BNbfnKdKIVFoWo0Fi3O9kqqm7Dfr4Y7ArXgVv8zdUH3wI/ECyiw6tMFpnQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXuEkdqWsnYQEHboyyotC5hA/k8JQUEyeJALsLgBqIwLq36Aqd
	5rv2NETtc/zCz2ImEp8nwMQKyJ64preZkVbgKceoEEoqDyOhikaZq0tqD1oaFvEkZY8=
X-Gm-Gg: AY/fxX7XkwParkTZY2DVx1qmiix5Gj6/VMuIwF+y3ON1oIdn6cEaI1Ab7yTYroTzkhM
	UEvJzaPDCwCFZT8p6SPA5+XFUf2bUoiSw+OytOnH4rOPUbq2SB0ZgZS6njNM+N0dchq+T0MX3RN
	j9SW/e4fTtI4EGR4dUCd5uam0tyc2ghW8vLmMGQCIzFYwj3qsRKQ9k7233QaYlSZbTd01216xtN
	1h2uNIEs4XutGGsBwJvjC60+kVp7tvQRyxdkteeFZv8PhJyYLPKPqUQCZfDKaReSv/8UlZhzX00
	UBPZGgXV52tpEM9NWBR0O5pdQhx/xAJJq4aHyWnThJfaB42HfJbfHKXfP1l0GLgANHQ88LmAMBt
	VxNUo4g/6Noh8vbv8te8Mp+VfEno/v4dokWJ9AN7iHb2utfh6jInVcOhambH95n2LRGQ72FnIWI
	KhaejZ609+ooo2GmCCuzwceEnJQlt8vm+WlaSooAuVql9FQlLwV0A34g==
X-Received: by 2002:a17:902:f683:b0:2a1:3ade:c351 with SMTP id d9443c01a7336-2a59bb1748emr52234975ad.2.1768459932812;
        Wed, 14 Jan 2026 22:52:12 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e7a3c6fdsm235081015ad.15.2026.01.14.22.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:52:12 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 14:51:40 +0800
Subject: [PATCH v5 1/7] dt-bindings: riscv: add SpacemiT X100 CPU
 compatible
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-k3-basic-dt-v5-1-6990ac9f4308@riscstar.com>
References: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
In-Reply-To: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>, Thomas Gleixner <tglx@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
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

Acked-by: Paul Walmsley <pjw@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://www.spacemit.com/en/spacemit-x100-core/ [1]
Link: https://docs.riscv.org/reference/profiles/rva23/_attachments/rva23-profile.pdf [2]
Reviewed-by: Yixun Lan <dlan@gentoo.org>
Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v5: Added Acked-by from Paul.
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

