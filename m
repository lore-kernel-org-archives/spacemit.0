Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5B8266B59
	for <spacemit@lists.linux.dev>; Fri, 14 Feb 2025 15:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739546261; cv=none; b=RMG3rWuToqZgMm0uQ8jvAryQF8Nz4nD8OqY7OAziJXu1nVVkR/T1S+bvBh9IkvUIjnrg0Hh47Jnhy4+o/wTDfrQTaMFLhtUdKTbcP5VnX5iW6MGrhyeedzghdTsX8spfMpd+/uSyNbzfNEwUUBcxZI7Xq1/vDUD43m5ZrOMgv+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739546261; c=relaxed/simple;
	bh=YS3dBzS1TIYwOXLmFwToghgmQCECpJ7fllGh6NUtinA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=HlG/dY8+k7JzVtfsQFLbyjo7gSgpvCKGsMTg1oEffITAD5VM1oJAe2gg44t3cVpTfKOdgElKOF1o38M5Zgr4pfsCqgI681BLNHuP399RgeuapsNE7H8w6zH8syedhPW/A9coJaBWG9O7Gu9U+a7d6d1daYaRW/EtddaDPPVuY+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CxAgg6cX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CxAgg6cX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739546257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rvaWRuIqMubpY/jSrhphDNgLxyWwrcegxArhQIPFoO8=;
	b=CxAgg6cXvCc7RoB8sQCf65Owy52DljcuLibJ8lEzGeqQo94cDIyQpij2Xz20kDE8C/bFo2
	yzQ9E9XzpvIJkQmQKnOmNM9VytXz6qVYie6BvLgrvpJ8ATzM5Xpow6Wsl7x8A6EYUE2ypt
	4W2yhTstgZ1691WJ1oDC4SixoGkcpcs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-MDnxHsrmPSKdjhQ6WuNjWQ-1; Fri, 14 Feb 2025 10:17:36 -0500
X-MC-Unique: MDnxHsrmPSKdjhQ6WuNjWQ-1
X-Mimecast-MFC-AGG-ID: MDnxHsrmPSKdjhQ6WuNjWQ_1739546255
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4395b5d6f8fso12045545e9.0
        for <spacemit@lists.linux.dev>; Fri, 14 Feb 2025 07:17:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546255; x=1740151055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvaWRuIqMubpY/jSrhphDNgLxyWwrcegxArhQIPFoO8=;
        b=e7pHUHYBMwOlaFOhP3EEiLXV2aly2N0FeAA4GsuXEZHGhsA8OpOL3shpBHweJeQolQ
         nWKjBOOMfRUNGhj8sceqiYeaaWDG6rnr/qJ3LGaoISNeoApKsbY6NbocFzIRBB9PUmqj
         t+Z2prWdRsqyKJmmoVqm9Gv8Z82wd2xXxQOKRf0kb9RgpSFOOcXdpJZY/UMX3cs27Iv5
         EydRsZEnsV4VvS3ST47phnCxFXYx5gk96EcHMtKo80SMjRCymmtkZhCtIkYpLt7w9iY2
         qWskJ728ezJ8rYZ4dyISXde7B/ST2r8iZGynjrKz6BqdCPSeNs3p6dbmNbcA4pcUmctT
         lWpA==
X-Forwarded-Encrypted: i=1; AJvYcCXbZu3UZXD+fRU1EVUy/p4VI0CiWSXCF05ggVcM08cLGxTuH5ALHwUycW0x+tJy4vIu7ETvQkSRBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3QTPSvYW61xEypkaGIMP/1XzB07jWnWI9L09ATAsbu/65kGXb
	hfJeLOo/I2Ag31l/9SLeiDGg9gRzf6qYLr67muxIS0R6rcnfT2bRJgIxNzA3/v2RPfRByNKiENx
	ODfQX6IFjxo14uFfuq3U0kbVp4W+vftFrtSLxVygkXlNBMhSvl0rIgk6KSbDdoEtt
X-Gm-Gg: ASbGncsutT62+pv1Zv9Q8/BZTN0uL0UaOy2XKjCToaMFUojm/qnK3SOOpEKHUuN+U/S
	49Uz6DZFMpIj0T4TmAI4TrmmWpHuClsLgpomF7Zemzpf57PwyC7RMpY1QU6UyBEm/S8mar0L9Rv
	EKaKOnR0Hu4WX2JlNKJLbzmNpvBb3J422xAqdSMD0D2RDLdF1yiYN1Dp/8qxUOnBum+/8T0OBYq
	MSWOS4xhLVMU/kesO2yvTjzgxv2lekYjT4oBESyNo4Ilokg8l3+jo5AQgH8AU9Nv4qEEpakzY8m
	NijREfd6/p4oiZ8eEZmRKlv8Ry2BhQ==
X-Received: by 2002:a05:600c:8509:b0:439:4858:3c77 with SMTP id 5b1f17b1804b1-439601a12b0mr94439295e9.19.1739546254787;
        Fri, 14 Feb 2025 07:17:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZ4cE6b9JE7HQ0foGmfeHs83Ot4ztX8SMgiEIT6K5P9Xu9N3qu7/a9sqVogpzuJ8xgB1pwiQ==
X-Received: by 2002:a05:600c:8509:b0:439:4858:3c77 with SMTP id 5b1f17b1804b1-439601a12b0mr94438755e9.19.1739546254333;
        Fri, 14 Feb 2025 07:17:34 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258fc7ecsm4808546f8f.49.2025.02.14.07.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:17:33 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: javier@dowhile0.org,
	rjones@redhat.com,
	abologna@redhat.com,
	spacemit@lists.linux.dev,
	Javier Martinez Canillas <javierm@redhat.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Yixun Lan <dlan@gentoo.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: riscv: spacemit: Add Milk-V Jupiter board compatible
Date: Fri, 14 Feb 2025 16:16:37 +0100
Message-ID: <20250214151700.666544-2-javierm@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214151700.666544-1-javierm@redhat.com>
References: <20250214151700.666544-1-javierm@redhat.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wkcxXGFa5tmZBZNXwWOtUoeBdrt5kOxXtRvoRUqfj8A_1739546255
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Document the compatible string for Milk-V Jupiter board [1], which
is a Mini ITX computer based on the SpacemiT K1/M1 RISC-V SoC [2].

Link: https://milkv.io/jupiter [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 52e55077af1a..077b94f10dca 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -21,6 +21,7 @@ properties:
       - items:
           - enum:
               - bananapi,bpi-f3
+              - milkv,jupiter
           - const: spacemit,k1
 
 additionalProperties: true
-- 
2.48.1

