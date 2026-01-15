Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EE821FF26
	for <spacemit@lists.linux.dev>; Thu, 15 Jan 2026 06:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459946; cv=none; b=DGOlRUkcTnQfIb4aTznH37e31HdHlbzDuGH5cdAk4q86RJMFIxTGzWICrpO3YL+7dk99OsYzzOuGcHSSz2j1bXb1TmAaVzAc6DHLFc+3eoiUdGvFwZ2da86/d4EnjtHSrHmpxjpQMQhj0bEg2idLLje4Dx/XOPjxLPSIFkUXCig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459946; c=relaxed/simple;
	bh=PbW1Vj0QGf/yy5Fg9JXBDXLV0q15HSZaWzIB4j92DR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y8PfONmCa1XzZsRMTaMxNUjO1vRWJMN/l0HI8JmEOxv81Eig8q2F7vG3y8JLkehk6CdCbqlcg1Um2Wm3ZqWleNdiD3Un8siDstTDRd+xOGAuDPKbK0y/l2DOv5W+hjqkiN6sfC0nUzHHg6EpVBEtDbkAKyitfWBBW0pc2UKwj90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=EwcZHiSC; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="EwcZHiSC"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a09757004cso4520405ad.3
        for <spacemit@lists.linux.dev>; Wed, 14 Jan 2026 22:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768459941; x=1769064741; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYYXZRYIOku7Vb4B3mqsPICr98BDRNcpwBcyivdVSks=;
        b=EwcZHiSCwpB7weSBiEnBzZjhoFZS2fuT783avNaR+8djy0HcfYfLjxvcqfjvbJ35DB
         Xi6wcnNg1e4XORaRQ7XH7Me2iEzucCOuYGNXpsgS259+q93MhxMC4S2aAXAc6tBSkjRa
         cR1SbVSGesL8dtvsZgnv1HoBp0VmnWYuLaXTlBpmG92okZPlnE6I2ZBKfPokA0S8ozCD
         t3aCZa2HBmCKrt+MtDoR2JjlujpndZpCTssTnEx4v0lEopTJ/erSB6sWpbDAUk5J2hnW
         vy6tcS5q5SGKMmrmHUUsrhal1lAKnYbiBnfbtMf2uabDZZtgH5YMFbcRfoHkokkfNY1T
         D99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459941; x=1769064741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xYYXZRYIOku7Vb4B3mqsPICr98BDRNcpwBcyivdVSks=;
        b=MeXYJbhmlykeIOoJGHGB6S5T7VXnGaSJ5SsgBq6OS5E2hjveTa1jmh6BO7wBAuuRSD
         d/JSGXhAUoRsKdYMcfCnbu5ntnh7WMCfLOWntXl/llKPabY7EueZVRWsGuuyuhhd2Avo
         J4AEmQi9Yma+iCO6dZO+7zcAABdgzbalVDyySBZ6AUKa3X/dHaIBTkI7RNTIjf448mkC
         pcM+tBIu6etyxz44gTbvND56NnLXLmYVG9zIYoFFLTlgRW28Bp2pGOCNYIu+w4r/PpDr
         qtnHC6OgLe1vwl5hwT7rnqb6H34uHQp+28i/EGQJT+8lKNlWb5dFKVAAZNBeRPeANOq/
         kPxA==
X-Forwarded-Encrypted: i=1; AJvYcCWUpydllKnv5VStyTWC3RYc7qfn76jI/yh69wlXKIVaiis9/sghQW3ED0uSvq2PnSoE7xHTn6mxkw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFaOCKcC3TmXJBDVKlGIVECQCE7SQPQrFAIVNHEP2kmJ7Cm/M+
	TkfJNeuG8pDwRACd8gMqH3cd4lrsxXYhyTqxiNz3k10DyS1LdSyc6Yh+Pq2A6Fn+AWU=
X-Gm-Gg: AY/fxX49fJQzICTJfsEI6y9rp6gCvdyBIW9O95GLwOcrgdgt19WsiC6K2ID1H4sT2UH
	dYxMh/uMx6SHpmEA0GsUWI5FuodYiucRBkkwyvebH5AiVfUorSMfh9XXscH/7cZec072oVJd5Df
	Py8Jv4CZmaDXb1dNQ1ewi+in+2jD672/J4dJ/pbLR+ygnTFGdNYQsRFpxlbcVTv326OZchBdxBr
	/6WGDaIxxIIR+HVahYxNz3rnP3fczuPd7qD14SMU4vKqBwCI/iKZfC1Y1o22pMUWcOZp86yqmF9
	Cjgtf35CzpqJOY1Wao4t6s9N9O5w5FSWf52Tx0iFIDCAOIggpD1cDwrCiQDMVl4D2mnUqXrk6yT
	1KAvUzIJQrkHNUZ9Ej3gLVmx7eHfxzO4UsLeJqN9V16hHNm/bLCSWZK+tYaj/wXy8ilT/ObFbW2
	XVjXu0ekXbAHPoI/3SXKEEhXs105kcdZANNgWxBmBtzU3c+fhWRbA+sQ==
X-Received: by 2002:a17:902:e551:b0:29f:29ae:8733 with SMTP id d9443c01a7336-2a59bc6819fmr46124625ad.53.1768459941521;
        Wed, 14 Jan 2026 22:52:21 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e7a3c6fdsm235081015ad.15.2026.01.14.22.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:52:21 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 14:51:41 +0800
Subject: [PATCH v5 2/7] dt-bindings: timer: add SpacemiT K3 CLINT
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-k3-basic-dt-v5-2-6990ac9f4308@riscstar.com>
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
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3

Add compatible string for SpacemiT K3 CLINT.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v5: No change.
v4: No change.
v3: No change.
v2: Add Conor's Acked-by.
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 0d3b8dc362ba..3bab40500df9 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -33,6 +33,7 @@ properties:
               - eswin,eic7700-clint     # ESWIN EIC7700
               - sifive,fu540-c000-clint # SiFive FU540
               - spacemit,k1-clint       # SpacemiT K1
+              - spacemit,k3-clint       # SpacemiT K3
               - starfive,jh7100-clint   # StarFive JH7100
               - starfive,jh7110-clint   # StarFive JH7110
               - starfive,jh8100-clint   # StarFive JH8100

-- 
2.43.0

