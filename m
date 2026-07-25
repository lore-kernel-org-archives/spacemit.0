Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CC031E85E
	for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 03:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949556; cv=none; b=UaU9G449Bh5Xtk7kirIQhAi5JU1aKbo/x9I8LHoAYflgDmp4IKELEfrxam5HcARBXK9DGfRMVJyeBFTGZ/5qXPDKfzieUXPFkKYYqPZWHVOWnBvH+HvNrD3vQsSeChB/YF9E0alF5zILd1Jglzty2fhsBcI5c7ZhEmG9kRo8tXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949556; c=relaxed/simple;
	bh=sD70Be1EFEVlYgvCDT/fN9L+7DpFEJJVPuxwpoqy0M0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AqkS4kY8gCwYwXzeZs3YOpF+B1zScRvR88B9hiW3WfMQTyH99C1qVMev6inB/JBkY60bx3VjPgrzJgAdolHqA+apGBltOAshChj4lJGuhYaMpqmP6RL6rQh12KSCx3BnxKWI0Um7eD8xublwprLly/bkwtRDvmaAY2FYfT7LJ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SGShqM0W; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGShqM0W"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-cb221a59829so23574a12.1
        for <spacemit@lists.linux.dev>; Fri, 24 Jul 2026 20:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949547; x=1785554347; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R27OrBVO4c+ZRT7KJNQVX6sAFfpZUPUtgxebharHHoU=;
        b=SGShqM0WHN7PwU1PSeai3rDWSChKbgwaAWbO8jMV6y9FI81r+N03cHxkj/gG7QxEIz
         PrjSKvb9cwqwgcjLuMYz3M5jqXKpOuiD7BXcJPpZ5NEuif916+NqBSKyj/vyr2WFPfdL
         p4G7FzTAtEnDFmyV8kKYhuzeXmMRpvTYKjCwrmVMIZ0xycH9YAZBztI85rjaG5kFfheJ
         9wCb+7s2cdMhMXBV8dTb2SEHQozCyO5kRKt4uj0z4m7sSJ5xW2tuNxsSgUkRbeqDGHAK
         Hig9bftosMpg0ekeW7aSXgxoEUhj477Hjz9p/Ei1b24kGDqp5GnSo4etoi4E5M7YD1Hn
         IuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949547; x=1785554347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R27OrBVO4c+ZRT7KJNQVX6sAFfpZUPUtgxebharHHoU=;
        b=QkVhBx/ZVSrh2j7vAr0m/ynsd93m5f4OPDnchU4nehtsnvOUWGJFagpsTYV4P7zviy
         c2JkTz25G0dzmOmfJzsAtC943axNFyCD6cPoYVjEKnn5ooFLbjAH4kpf6l8T/bNL92y/
         B6gEqTNVLQ/rPBRJ4+0ayA7a/YtNf5dQefX6/1HK/ENFVz679C6DtTlPd1NNGRWOilbB
         oSoyM0zuncH7HbmIOyjNlzXfOIYRMwXReGFYTdv5MCs340t1lbyw654O0BWwRnSMuhcN
         MuxDC/ZMZaz8ID8pEpwfVW5nT9pBnNWJL7e9qdldm6m54H2zmqhAIxR3GXFGRgQ6Whlp
         wMhg==
X-Forwarded-Encrypted: i=1; AHgh+RrgLLMP7kAIYQDgcJoQ6ymPJwRC0N63qEe/VoE2vzXCXpO1AleLrlqoOopWPf7TXgxwaokvSNFWXA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWXBO3N/OPe7bA4nHj5B8OFON+NIG20NSrHpxg4E5fEBEOrOpS
	NWpEGNPAn7X6PEWTjK0qwR7NQOyUCYFRtfz6KcE+UKTS67syNWmyY1eM
X-Gm-Gg: AR+sD12S2lLRUlCYAuDmnNTS0er5p80R6KjOZucetYyyexRRePzfM14YbrxmFHiiy6c
	6YOhYqiVPPWTr4uay6AK8F3Gy4rBKmQnVdIzTg5B7DM2bnaF4UxAKiycMqlaOloUobEZgpSFE/g
	xwKs6tfBemZYO0A30OFzE2fuyKp4GMbCB12R/zlcQjy+i2nbD8zOhMNIM2OnwHIqdbMgYokkyJA
	xH9JzoIsktd0ZHyYyOdGH23YnnB864oCwVhQO26SwmKQVLuXtoOyFVzRpcRAgiMhidNN+PYcGmV
	nBz62i8NS0yOMMfdEMTa+nsuQtdIRbyyd8Fc6mauKtmPirGe6B487EebqlIHd5uYgRt8V5xnYFE
	uKN/jjIv3FV9O8TGY8nKU9AUBQmdSHOAjHct1Sk6vBxPeixJC1PobVHo=
X-Received: by 2002:a05:6a00:852:b0:847:9919:e772 with SMTP id d2e1a72fcca58-84e595426f1mr573194b3a.21.1784949547576;
        Fri, 24 Jul 2026 20:19:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:19:07 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:45 -0400
Subject: [PATCH 13/17] MAINTAINERS: add SpacemiT K3 display driver entry
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-13-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1

Cover the Saturn DPU, the Innosilicon DP/eDP controller, the DP PHY and
their bindings.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6dea93a41962..9f2910a17c38 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25436,6 +25436,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
 F:	drivers/i2c/busses/i2c-k1.c
 
+SPACEMIT K3 DISPLAY DRIVER
+M:	Cody Kang <codykang.hk@gmail.com>
+L:	dri-devel@lists.freedesktop.org
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/spacemit/
+F:	Documentation/devicetree/bindings/phy/spacemit,k3-inno-dp-phy.yaml
+F:	drivers/gpu/drm/spacemit/
+F:	drivers/phy/spacemit/phy-k3-inno-dp.c
+
 SPANISH DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 R:	Avadhut Naik <avadhut.naik@amd.com>

-- 
2.43.0

