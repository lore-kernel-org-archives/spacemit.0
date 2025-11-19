Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C78F3563FD
	for <spacemit@lists.linux.dev>; Wed, 19 Nov 2025 11:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763553204; cv=none; b=fUTsqI6iafCtvB32DEB5fiLC4GkFrg9aOr3Mv8UI/EIuc5davgD8v4REeHTlKRmZC5K3JljlgI+0fMUtqnTK0G90zJJEEcrCkkacLxxgx7HkugIkBNoOa43vlXKfj6K3i3Wv1IyT2RHxyVQhCSA15I2CVqNWuBaEWf4NdCH2b8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763553204; c=relaxed/simple;
	bh=wFzeQXtiZ3L6svBdjl69noOh9R1d9Ukhuf/3rX8Jnhg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eqiZstghqZDH8Lcww05zId4vRnfrs6WaoRPxkjB93IzucjX8cIhqxnTGolCq59Qp7Mq81bgCyALtFx8Hr9mcfGJ02Qyyzp1Evhg6pRhDw1KUAgW00eHYAMjyWQe10uNnBoozoRs0t5Zh6fnBnxxz5Xgflb47hsPaRqLWaTvxhk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YTUULWu2; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YTUULWu2"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29516a36affso80604705ad.3
        for <spacemit@lists.linux.dev>; Wed, 19 Nov 2025 03:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763553202; x=1764158002; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=skfEWO4eN+7+KQ+Krvs4ImgFcRb4mPoxQdEUCrGLOW8=;
        b=YTUULWu264hlP+Q79Pjk21Ka+2eSjxZROYZ0ftsXuGCGn4EfpHLJwhubGi+x7xZgzD
         rUEyh5GaGLX+P8mz5m8fFShnoqkql/uewlPH46gkKb9gXvu2ly7ZqdPsy2gV2TNGF/AR
         7FEI7VN33Pjyz25Wz5yL0VI1xH9+/uM7E7XGwmYD/AJve4XkPiFN7HQwSTBy8oxlY9r8
         I+U32y2F4LivS5e2PpOSHrPZt3fBXWJ9xgfh7VLNCYA2Z2kduChstUD/TP6qUdwajY3X
         jtViu+E39fZQbqwV5W7oJxgzZ9OpFjLv0PfRuG0w1YZobCOZdmRmHE6Eu/kkeJxUzUix
         XKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763553202; x=1764158002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=skfEWO4eN+7+KQ+Krvs4ImgFcRb4mPoxQdEUCrGLOW8=;
        b=PAkKPtQeNDh1bWkAJz0M6+/TFwdAjFgI0KTELMtPwuJoALt/EUdiYCNti1gcyohJlj
         6V9T7puF5LSFWdGHxLfQejS7hjMYmO8WMchU7hKCE4HmimLrYIe74BgPtV/22JMmyOgL
         HlUYLlhB3NK1RYu6qUEYrUmcgNi7PkqN7CWATUW/meu7kNIwdD2b4q3cQPNOBHg/FZp6
         9ra2FbmxcaPdUZZ7Ph5nViaKuj8sZPvEDEApcFEq5pk6pWb0YbAaBrjNtRqV00zghl7/
         d+4eQQnoqxeCb0pfoowuw3HKSwnT0xOJv1rWiDZK3BzQFs0c5AoONZzF8ikkKVImP7ta
         z8iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF1HFu8da7X7KWCaeR/bYh+tObQ/N8zOkNbmwsb7hU26K0xRpdRHydR7kUFcYp6a1lEM84QRK40g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxGiq0aab+fhfpuvn/L6hAOMqgRhmA8+YYG5DQXejp7PXhvRVi
	UHXVGErsw2gHhsDkJRvTzbWadPG9PcBcdqAibGQC4RrWqjdpk47/nVkt
X-Gm-Gg: ASbGncvYZ3mYlbZtwdZWOc9Me7IkYZ6MDJaJWyHuJyKT63afWDKBzKfr3PFBQ2E/hXm
	9A5pRTOnXiPhPMXSt7dXz0UN57N0+OAe4ohdyfjZXkt/vGUnJMm5gsByPsS8yBRiOl0Ta2hXtY6
	D1yg3JZ/ZgjuTCXhV9fUF1DkhV71UFflNhdj6m3z8O3ACSsnbEX5g+LyuRjq0iMg1BkzI/6JpuK
	8ZtgkDmpl4OBj5HXCuh3nCFnR6Kno71GN0GABBaW+Jgao3kzRrq6MrZzTgEfRwtkDVjH5DT/hHw
	rMy9brwJsftuIbX9edAsftk27tIAKPhXK2qFbh/jNtjIFJ+9zp74+Ai+dUiSe1mzZ+wtbs4s29l
	ud+QY7jeYF2t2RDibsc/tFeY933L9JPfm0E0EXgKFql0A5z7QX9hCriqT+mgsz4g8TIKQvu230m
	mpfEq1K9/1I+XZv+38Pg==
X-Google-Smtp-Source: AGHT+IGET/ADp5+3M/u89aHoTgTVYMvdcAxh0XdPkWhPO8kQbc9hPt6srasly6bIofN3a5NJPfXDpA==
X-Received: by 2002:a17:903:2449:b0:295:275d:21d8 with SMTP id d9443c01a7336-2986a5eb5e1mr242990795ad.0.1763553202409;
        Wed, 19 Nov 2025 03:53:22 -0800 (PST)
Received: from localhost ([2408:8410:7820:651c:873:1d7e:7195:d122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2348afsm203445405ad.3.2025.11.19.03.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:53:22 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Date: Wed, 19 Nov 2025 19:46:43 +0800
Subject: [PATCH 1/3] dt-bindings: i2c: spacemit: add optional resets
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-i2c-k1_reset-support-v1-1-0e9e82bf9b65@gmail.com>
References: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
In-Reply-To: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763553189; l=738;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=wFzeQXtiZ3L6svBdjl69noOh9R1d9Ukhuf/3rX8Jnhg=;
 b=4RO6EP06dVMPaF3EjWiiIGCCWCqY2xaCe3VBWKV7PFNvltdFcuEanM/AKzxhjXnUjU9i+7cb+
 0Qep593NG1tApNtUxjRfBGcXA7WIBA6FeUH/NIA7iZBOR8rTw7y5XBj
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=

Add optional reset property for the SpacemiT K1 I2C.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
index b7220fff2235..3d4faec41abe 100644
--- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -27,6 +27,9 @@ properties:
       - description: I2C Functional Clock
       - description: APB Bus Clock
 
+  resets:
+    maxItems: 1
+
   clock-names:
     items:
       - const: func

-- 
2.25.1

