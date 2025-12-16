Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C513BB838
	for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 13:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765891998; cv=none; b=bBj68QvNo68zhW0SyFu5R2IocnzjJk94wCe7pohOLhEqYK6Nup8gH5f7tlUx36kNzDfFxgljUtoO0Xl8geY87qGOGR4qO8XIQ01Fi/h+uvCKqaR0TuzMwPrcw1pVFzCSjoi2WKCHKaJ/YGY9lSOY7tUIM+DiB95xtue/P722BQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765891998; c=relaxed/simple;
	bh=EoM0juMOXjr6GR2unrjDT+d+btXpji6LDeK28LHuz0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VKAE2CjqLhQo9PNWEVEwueQkUTd3pRqc0Q+gkBPeQmAtu8dA5zFyR3FV9tupnspnxHn0Pjs5cmBpztkLXIbJOx1G6o7iZ4x61xfSBQ55ozfT67dXsgn/865TSQORlBSXM19Os1PcEbB0N8EB01uKiJqM7RYscKENbDWz33Kdci4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=wV995HR7; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="wV995HR7"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0d06ffa2aso27405765ad.3
        for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 05:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765891996; x=1766496796; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YgtnPUK83eGnHHD4+3Z/OSGEDGJ36/32wtdJor/AdJU=;
        b=wV995HR701nnZa+Oi7jOxoHMysuIfszsGOQUD7kFplHW5L51lX0SM+v9P+kdlBHUDJ
         a0lJqyomtxyGoiNy6jwlGYdXj9B4STZiM4wIVqgm0C6ekc3RZmhsJhnCbuMIgiWGvqdy
         HX44JvgYydjfjpwmET3jMx0lVbL/vBkVLXijkTlUZ9bMxlFocC4pmAiWi+j+5Zoz2qrK
         Y8GoLkLJS76CnooDUmwNZ9mD8Rk5y+bFlhPdVbV4BPP3XrkfQnheaS4jMS5lRYP/uVbZ
         r2djuJBvAhTfCGaLLkz+LIxB0ezP5iAjZ1MPj0Tyc4+ZIYlUkbMtkntQu6XIV252P4wz
         dAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765891996; x=1766496796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YgtnPUK83eGnHHD4+3Z/OSGEDGJ36/32wtdJor/AdJU=;
        b=q9RzlWFPKec3s+fdQV24QVzn8kp8LRe0tQHFXSXes5eVN5DaLhak8RO4m5/0e/KOxi
         ZPAgxVNRx/cB7sun2SYZ6YwMMAmZ2HFRpfpoRJEzulu1BazrlgWHJOSn64M3lhFs6o6w
         yOkHSzg53XtDeJQtjDiXuVJkg/4zKBT6trW/wcjZn7GuLmuQE+pWQP7zHmdpTogaOnxa
         DYQbf+t1ubzIPQyE6XyOVmu5VPQp1iF4VI0LbeN6XQCoSJkhhoKTklrtRzT5aKKx0C/w
         LAb0obPe2bBadFETikyEDxgA09qYgj5XxtldqLx9Yzq0wVcSdcHBYWc8bSZwbUNVlGiI
         ebyA==
X-Forwarded-Encrypted: i=1; AJvYcCVmBs1/21bxHfmE30K7kHIWtMbuQgYXdE9Y+/u3Yqb8Z+oeOuYYwr2wxI/CrtVU8g2RqePsM5uWbg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxETLJn5tUfropz2dRFiPTbLYoz9t0Va/sZIODDUj4YMrNqKSRG
	dQ4cLtSWG7iQorXV32tH7OYBJgwts0payDZgpFt1LWkn4xnPOjOCTiOD/MkfBHWBsgE=
X-Gm-Gg: AY/fxX4FTTaipCD8jA/Dl/WKe+tcf+n30mrTE74fK2P+vWGyQ3HdKwmsq/vjqJHwS8a
	YI3PGJ8M4P55Z27QOVv8vrx/N8/BQtqA4LYkrA1Ls0NlC0pg6tEkqLPms0xQMEF58o0JE0t9H5I
	arkupiwRtBTmd1IfQCpHIKfHuv28JEmA4G4s26+wAjBTr5mg2KgDSXRx9nwKfMMTtOAWVm9tp/f
	30KBA3Dm6qCHKb/UBmsLDZyyTwbUYV3wR2sx+r0SsyL/UFzl58AIlDLWU4++eCVP3aStqU7/OsO
	GNkk/2k4VReRaHC36e+2OLVd25n0ACy8JIvc/sm44id6lFMvkhwv7+RckBH+FinGPdV6gJEsK5p
	hMs6sSz3BAHwUMrTvKUyklpj4CebO2rXGJqeiuZ1xIo0W9DVKS8wTh1QJCEN+3t2Ax7Ri3LRmNe
	bNyaKSuPWVEneDKap+mmNQORba74HW27E=
X-Google-Smtp-Source: AGHT+IGY3Bl6L/q/ucq2o7krHMUCV6pUZcjqotL6XoN1XRPjp4aSVY3JMf/8mH7J80vFyBB1R/u+VA==
X-Received: by 2002:a17:902:cf0b:b0:2a0:c5a6:c8df with SMTP id d9443c01a7336-2a0c5a6cccbmr98731775ad.21.1765891996120;
        Tue, 16 Dec 2025 05:33:16 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4029])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a14625add8sm15829525ad.61.2025.12.16.05.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:33:15 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 16 Dec 2025 21:32:26 +0800
Subject: [PATCH 2/8] dt-bindings: timer: add SpacemiT K3 CLINT
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-k3-basic-dt-v1-2-a0d256c9dc92@riscstar.com>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
In-Reply-To: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Add compatible string for SpacemiT K3 CLINT.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 0d3b8dc362ba7e8d0ca6d0cea692ceddc5e1f89e..3bab40500df9bc2ba4f7d6f1bf340c8cbc06f9de 100644
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

