Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AAE26D4D8
	for <spacemit@lists.linux.dev>; Mon, 28 Jul 2025 14:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753712434; cv=none; b=cKN/8crS1v5XNDk/+E5+w9ZyxeECeYa/6a15ssfJDfGE+q3wMMzK3GtaH+zfE6uQaSZ7oKdLLFG3GqkJhyMa3mJb4Gn3gdxaZZJ4HNvs6caWlegeqm8GI/EA3kDHw6bBlH5ZBGDGALEWKrOIppRowP86l0aHj3gIj2meXq1YXVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753712434; c=relaxed/simple;
	bh=PxJJD5BdYiecz3+HAlAUv0mqXDsb9508pUsTSJAhu14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VGv9vRqZQbiZTx+3g/3UvyYNoAi1GU8G4AGQtYnm90tL5D3s/qGPDSSceVlCKqZpoQFh7HJnQe58goMWauvLGNvheY4PbxavYvBwSS9jDFSciCGMTZHxN9r2corvY8mhiJmqbgS1t3zGbtxhCwI5Olqdezta8dFbWhJCvjNFM/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hgqolzo+; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hgqolzo+"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-76858e9e48aso744633b3a.2
        for <spacemit@lists.linux.dev>; Mon, 28 Jul 2025 07:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753712432; x=1754317232; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fCuuegqOgh7yiTp50CPz7MDoO4s4zlMG+vfGbQq2dc=;
        b=Hgqolzo+ZexHHM/4Z9PYM0r/81vXLNaacf5IFjBma4++IWNMc9kPZoCKs2ur41PCZt
         k0USjYzfEqR0csEpiNhxx5bsVsuZmPxTzqeYr64HhioYmMRmRgmscukOKdWExsp13Eyv
         6F3WJucPW5nmKD2sNIQK5V4BkQ12AYvQGsnxlZYLj111B+FJ0UvTxvFCysTshiSxlr+a
         bhVBKv+Orx1K1fSsj/yXjWfsJtm9jpTwYQBcUB7WxHRzLueU0VyQn1LuGCl6l9SoOrDK
         Sb6YhxeCJs6xn2hfPN6kzuPkDPE0wwlRKxWvqftKvlrvRBblttFZsbfPS2y3fVKe6GFU
         8hIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753712432; x=1754317232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fCuuegqOgh7yiTp50CPz7MDoO4s4zlMG+vfGbQq2dc=;
        b=v9kLjhxQRKvqoxHq6MULSHmG+nNIuHhEbSNl/+YZj1XGy7wi1uVFwypzeBV4hPm4EP
         mVVT3zahY05WYr50pec4QYpkCxGbDpK/tpOLyU5IzYvz1U5GTSPXGsohjcBpVH8b1YkV
         mXRbW3vtAu65gdr5TPepKXuEbGhXcI8KegoBAygCrB8Vhb9IGFn9ljwazBjIbJniiKf6
         uy62AlctFVBvyO+h5vh6I6/Lw3xdpGdLUra+UDoF4eS0560m6EpXD8pL5ScLRbhtC4zl
         +ysKu9qOiU6UtzOB73HS4ZwEV6sOgolnMLRK+mVhxQX+3fPvP5R4e/i6Lg9KliQu3DoB
         rwuA==
X-Forwarded-Encrypted: i=1; AJvYcCU5JOQ4rsRx0+6qDSGS9G6Nxt5Nzn2N2hGpQ2uXQgYx+KUMoMCYJAgWltfwjNqAoANHPxqDRDWw8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5hzWITOqVtlbyNiMUelYwbsgtKT6/61beR4LUFAlI/j8JvdpO
	thFg6nmjIVKxYolv+3xlBZBALrSAuwn+QKSiCFW4l2jz+AJcFB6GT/RE
X-Gm-Gg: ASbGncv1MBRItDQniA38mdUth5kclFUuGLwFA+kG8TEiq2ClX5r7VlqLQ1325xTv8qg
	S9599PkVI2nkLqby4PQlu59LkPBBHWE15BK8ZzBNccaAKzfPADPvvDVFuQoQ8RhhZ7TMp0riDy9
	Rm3TdKUrNhMoBUn7I4T/3O0sO/zpyK5G+cTjpTHM3diEr03C53klqxOEcbU6Dn3ZvdrRbTHKmRj
	m+728gAtatwhBzF4Xdqsg92DmkBCDCqG+pPywJzZDa0U6ONKyhJ7EeE1lD8AibBGVmq4/1+CeeJ
	uICakqVhJncAfHDGdGfE4qfiK2TFmP/qAHq3yEBzz1o9ZAeu/rUh0x4uS5j/MOVnIXtSnfr/QRY
	S20SQA+LvhrDWwUXdIMyyR1MB8nUIifBF
X-Google-Smtp-Source: AGHT+IEObfYk/Wz6SuT7jPbvRWcLuE1W9sEClVf+JDsYA2szDPxZRsKWqL3+hYUXv4qBE7HxdUFs+g==
X-Received: by 2002:a05:6a00:4fcf:b0:749:4fd7:3513 with SMTP id d2e1a72fcca58-763389ac8ddmr17218955b3a.16.1753712431742;
        Mon, 28 Jul 2025 07:20:31 -0700 (PDT)
Received: from localhost ([2408:8256:2284:4127:de49:6dc9:a446:157a])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-76408feb725sm5638582b3a.60.2025.07.28.07.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 07:20:31 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 28 Jul 2025 22:20:15 +0800
Subject: [PATCH v3 1/2] dt-bindings: clock: spacemit: CLK_SSPA_I2S_BCLK for
 SSPA
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-k1-clk-i2s-v3-1-5d7579f02227@linux.spacemit.com>
References: <20250728-k1-clk-i2s-v3-0-5d7579f02227@linux.spacemit.com>
In-Reply-To: <20250728-k1-clk-i2s-v3-0-5d7579f02227@linux.spacemit.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753712415; l=860;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=PxJJD5BdYiecz3+HAlAUv0mqXDsb9508pUsTSJAhu14=;
 b=AR0VW6KLcEEQ1zKFa+FXIaRCpIsXGTDIiSgdsPRiKOVyzjaJvdb7zMJtedM2MZ2oc3qcz5rlq
 kuoNFsP3bN4DgKsQQIamO7iA44EY3wLztWmhbxcN0QtEPsV+5GMDkBb
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=

In order to use the virtual clock SSPAx_I2S_BCLK in the device tree and
register it in the driver, this patch introduces the macro definition.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 include/dt-bindings/clock/spacemit,k1-syscon.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
index 35968ae98246609c889eb4a7d08b4ff7360de53b..9be578953d71e79e93eb10eaa35b47b97812e826 100644
--- a/include/dt-bindings/clock/spacemit,k1-syscon.h
+++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
@@ -179,6 +179,8 @@
 #define CLK_SSPA1_BUS		97
 #define CLK_TSEN_BUS		98
 #define CLK_IPC_AP2AUD_BUS	99
+#define CLK_SSPA0_I2S_BCLK	100
+#define CLK_SSPA1_I2S_BCLK	101
 
 /* APMU clocks */
 #define CLK_CCI550		0

-- 
2.50.0

