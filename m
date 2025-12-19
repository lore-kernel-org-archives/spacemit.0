Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A792D1914
	for <spacemit@lists.linux.dev>; Fri, 19 Dec 2025 07:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766130161; cv=none; b=XMGfuhzEkIGBSOXeM0XxXgidegjts12MbNJHWkDn+x9n/pOzB/taf+ck0WK90zbjLmX7NgyiC74oBfAOjCEx/IGXA12SxeS0M5+zqY4MYXCJjADjemLiEX9cHKeD4UAc7v7a1Xtes8j9y7OQ/RwgB0PFfGvAVQi/MBWII0QpdEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766130161; c=relaxed/simple;
	bh=/r6f9IRpVGju3Ryu7UDsRNF+0ADreBgeJr9SFE2YWMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GjtMddzeXctwGklWTowvCFzAcprjpVRMsptxEUpT/G2gklKJRabXPLIXW9Wr6GCGXHAPsMcTttPD0doZc6aI1USRhYgQJ77BX7OZ6Vli+IhZn8dBSqkMas0y3UcVstnYrc9EK5CI/uaXHRC4FDhtFg8rqAXF+1V0xiXK76pE1eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmUEf3VF; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmUEf3VF"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso1301620b3a.0
        for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 23:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766130159; x=1766734959; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A16mIOMQmuaHn2+TKOnGQUAwRDMDtpdj4WXcnB4hmwo=;
        b=fmUEf3VF4E8ggpppGW2GQ1dbhFCXgJH+apTOLxjOIqbyscOBcjiCGs45IDhClApJ0/
         CZz7xPiMcnu/t5DQAeZReqmss/YXnuS7H4ZdT1tb9yCVWidpYn8O1IttQDPdgQL95q99
         HpeIjthih6knEPQ99vRtJKFBzH26vwA1fllGKAHmx/xefVTybMLWhX04an5st5d2MAo1
         vqG4bGLlvOvffOd+nCzz5F/jY6pFtnX/808VwuWmByItnWAznaF9OiBAaHLCsJ2yYqlb
         aiOZhmKlqVdro0CN6I2iGIADsD4N+khFGodWIu7e2M3QOTs3xrmvyPoFCPSIqqz7tYeG
         YmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130159; x=1766734959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A16mIOMQmuaHn2+TKOnGQUAwRDMDtpdj4WXcnB4hmwo=;
        b=vfpb8Cz+izXg3ZeathDqQKlNNb07zzKyxF/yzFh9T6cX5wKM3XUhywW3Ygs9KjWRxm
         NyervL6RPjfGS3pkKyzpOdMn1b/VRTVKaXj41NyUoT5wU0ko66u3luQFw3MM8/c2FgFH
         ItOt7zubK6i5jo/cBWiYnUFM33+o02C4pC3iWvT04r4wDHt76UqVPMJDea9Rmf0zUQzw
         W+UKKTa7MZE0on3G8TnIdmjZJCaOKBhOn8br1d3cU8dknsrw1RzRuTVOhLS7zBPDPBiT
         ppQ7lEJEDkO7SYEIS05V8blgp5LARa6iQAYDFEg8+/aV3BUrd7rGlMxFY1QU6bvv+6+a
         vkvw==
X-Forwarded-Encrypted: i=1; AJvYcCVS4V8p7N2Wyiu7CzYHtK8lfP47Tf6hsVXRVurTOz8oFY1QJGiqxZ7/KCa4QJum/X9i/XwpLOuCBw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd3LS6CZ+GmPNYv10UmqETspLchmJNkv4KiAS2nuyJbDuBykT9
	PJL/mL9K31zWFhdNutl3AK/CsJp9yDwGYAoaCwZ9GR9ESzdfdS8du2dp
X-Gm-Gg: AY/fxX6MY9TvPAoRWPOXPGcgxxqd9xYDKdRW9xr6nTwsTjKPovKVVWXrgAI5reFZ5rx
	6sY3cCo14loIyriG/JygdF/u49yFnncMUrAK72T9TT5b2lowEWzLpCAIjrwA0E7kLkusNFkR5ao
	rlWmc0eayrK/fANgC10Scmb+8WzAuEJFULfz0jKQqasqGPUK08o+b8KyMCSiaGFq3YET3eEwlZ4
	mP/HsJCfCI3rEYd4jm2/+DGL0HATwbt4krgka+dqPjzqCTM94eBpCsvZSOUQmRoKeuepwHX/e99
	U6HCYSgbCVLhT+GsaAQM2fEt1eWVzkAkOdYLq0t47nPXYfoi7LQBlV993bYBIwvhSclvAv5xkBX
	ZrirbSH3jPvlfWhLJCH800uhtDxf9J10yoMvC4btvKjHpt1CtI+2k
X-Google-Smtp-Source: AGHT+IHMDEZLLOxw+3dAFpieF2QA1Yfe4kaK1QG7vQqgmnkvKYHURHQzbX3y21w9Lj3QQl7AzO8tFw==
X-Received: by 2002:a05:6a20:914c:b0:366:14b2:30b with SMTP id adf61e73a8af0-376a9cddf9fmr2091296637.62.1766130159109;
        Thu, 18 Dec 2025 23:42:39 -0800 (PST)
Received: from localhost ([221.192.179.86])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bd602desm1335791a12.21.2025.12.18.23.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:42:38 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Date: Fri, 19 Dec 2025 15:42:20 +0800
Subject: [PATCH v2 1/3] dt-bindings: i2c: spacemit: add optional resets
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-i2c-reset-v2-1-ad201a602e74@gmail.com>
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
In-Reply-To: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, 
 Guodong Xu <guodong@riscstar.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766130147; l=857;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=/r6f9IRpVGju3Ryu7UDsRNF+0ADreBgeJr9SFE2YWMw=;
 b=wvV25q8btJ4G30xXAzQfVKnpzsZrDgyjSlGnmi9bOhuNQ9Aeuh6j0rLJZZ2UdmpI8Wk3BNmIX
 Bd8J5IqmhlsD4ZMfSltfVzsoWEpZ9saVGE6AaJqKlfN0k6035M6lSH8
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=

The I2C controller requires a reset to ensure it starts from a clean state.

Add the 'resets' property to support this hardware requirement.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
index b7220fff2235..1290106e28e6 100644
--- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -32,6 +32,9 @@ properties:
       - const: func
       - const: bus
 
+  resets:
+    maxItems: 1
+
   clock-frequency:
     description: |
       K1 support three different modes which running different frequencies

-- 
2.25.1

