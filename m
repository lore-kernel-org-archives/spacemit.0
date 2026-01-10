Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F07823ABA1
	for <spacemit@lists.linux.dev>; Sat, 10 Jan 2026 05:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768022358; cv=none; b=WY9YMONad8BHxLIsD7jIEXJPp3zfPoE3WAO9zNKoJvJStFue9K/4Dr2fkAhEyVvwGz0x89BuPy4iM8PEj7tAFcv5lO1Lkl135FZNO0jWbu+1YGdpVgrF7FmqQJtNufGvHAdalKz+0jn+cTxP+I+3QRK6bYSS2Y/qKyx0JUFNruc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768022358; c=relaxed/simple;
	bh=/lTsWfEUag9M5I+SthtjmfrBk3zdILT7ZryxekX5KgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hgxNiDqE5gmPRDfdcJpTq/XZaOPfkHdVOwLzE6TlR5K1eJTgh5PXz5xIsEC07uMTsdGgDF4wM7qdMn9oOrqV+wWBkER1INLisHe7ThfjH2ffB7OWPG7V3gwRICnaAW+nLEdjv0lQ/l22VdfDRYi+Oi4MqzbN4P4hw9mn+oiJsaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=kSCgQx9k; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="kSCgQx9k"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a2ea96930cso33942135ad.2
        for <spacemit@lists.linux.dev>; Fri, 09 Jan 2026 21:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768022356; x=1768627156; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DEt3VwPXqyMp/tcJZWmY7ZYQbqO9BpVvWujfwQFiGY8=;
        b=kSCgQx9k2ood3ANtWHjqUs4XZV7gejrDW15+jgD5BU6G3pjhkUwx7gshWTFzUrNn9b
         A9rVmbHLDqLc8fn1VJwX2+Fdsq8WMEmthHf/AuMURrnWlc7GN5rPt/XDFeQixlwxWWIv
         NAWl4Gve1NeuD+BHyT7JqYzZ0jzCW58FYS/e4i/LBg1HdwL2Dw33zBe505ujIKGWYYdH
         mbG2FCojzqWlcX+aXusYm5ngjWXp2Cl//g1dpIL5yd8vlczpq2aAXSyb3xNw3/LDyt6c
         pPU9BtZW7UqAiccyLvKFeQudy7YjaqptVilW8BYKdPvexkW+JqeEJvRnNLSDVI2+0+yg
         zR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022356; x=1768627156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DEt3VwPXqyMp/tcJZWmY7ZYQbqO9BpVvWujfwQFiGY8=;
        b=cGaJ6lNgruuLwdWZjjUln7je+fVK1+f1ALDurA2n11JogsHUpiLfArU9xEDI07vqTv
         tmAJ+0jxNalotIN4eWzeGJI8MEsZ63x1q06QoRcczbdlkizFTM05j+IRC6tB18ERPxE4
         ffQW+ym0eCS75r4rClLMfkvST/e42CMKOuC9FaTE8CaR9CiYuyPyWwLn/q5ifcAEDSNk
         gS8Pl9nR89+iB+DJW1lMvUYu6FiaTKH4URv8XREKzjVKgrjO2vePnsHuKOVrN+3sfPkj
         05P2JopCyUM7Mj8W1ff2aQwmoIKBeImpT3UWVCpDJjnQljKBr5n5MyORUcrRAzsy0TjX
         6KLw==
X-Forwarded-Encrypted: i=1; AJvYcCWqFERtek5VWhny7NxB1FwfP6Aq9LrqHzo2N5yNQNGvvjIeLcADCQ5MsZhEm9trGCaJqK8Dts4/sQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnKzskqFLiAEUeKzGuMPreqlHlrT54mIX6Ptn+WDZqWOq0l2RK
	d6qnTEw0sb70sWi5EB5UHhGUkIpGQgrc8XV9P4npPMxW3/XzFOpkLFfCdlbSdtxAqnk=
X-Gm-Gg: AY/fxX7oHnSItcb2mITwDSyFiO8THt9OkW4+VRhhY5NhRHsvlBEHR2xPw/bTlePtrI1
	NbwPAgUOyUCk52MlwmH1DIxa2arW+jUDp+irCVjj8f4VUKoPd/2yNjHTEh3xcYLeLQzQXQ7WLc1
	rzcIXy1bt06L+H7oOcsTXsrfcfWJhlQqk/XTMNs0mqxSz8UCRZxp79ajxKfvWYzCrExejPD9QND
	syOrwhh04892TD9+k3aVNT9cIIAi2vilLcutjLucPrtb6lwDmMskZy29PIQQXzjnCCB/3cVFPw4
	Ws01d9oGr/1oLOUUJpYyuLgelTRkv6xv0BF+i+twGwCRtVQoRARIt/NcU1QERb1ELt7BJB9TWEi
	K2mx37m7x+h4aI5m5feL81E4pdGf6bUZ8d5MFTLGZs2cWVNGRvMAN43GX2DTUoiosREOoTIYHIV
	jQ+YFYRxxAaEz1QaQEVAxM9oD38s5ryZ0DfgDuj23fJ76V3+XMU1D7CA==
X-Google-Smtp-Source: AGHT+IFAUkJBe5NUVBgMgG0885O2cnfFnOaJYFiVEjS7bJDb2MRQEGYB6WLZDNiAx0QS3ppLLiX9Hg==
X-Received: by 2002:a17:902:e943:b0:2a1:243:94a5 with SMTP id d9443c01a7336-2a3ee4fec29mr116348805ad.47.1768022356567;
        Fri, 09 Jan 2026 21:19:16 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88cdsm118208265ad.73.2026.01.09.21.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:19:16 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 10 Jan 2026 13:18:14 +0800
Subject: [PATCH v4 02/11] dt-bindings: timer: add SpacemiT K3 CLINT
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-k3-basic-dt-v4-2-d492f3a30ffa@riscstar.com>
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
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3

Add compatible string for SpacemiT K3 CLINT.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
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

