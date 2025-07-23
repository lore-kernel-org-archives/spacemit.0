Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D5C8F58
	for <spacemit@lists.linux.dev>; Wed, 23 Jul 2025 13:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753277146; cv=none; b=ua73PzfFrOMVV5J3F4Zes25y4+jaOceCtlHcfETAiWikft4EixZqPWILFtlHqrk9WpNUxyAA6+MEQtpRIr2AIs8nF0b88Rt/mVh2q8rxnbMssFviSM2iT8REjeSKx7SESDbjG6hgm8tzkrAzhmjHhl5lKox9wBuElDMA2/o5z4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753277146; c=relaxed/simple;
	bh=IRWOjBedd9/hnuVTcXrjjqnFUAKjZDKX/qV1HyL1jLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HVFQW2fzpRyImPe3/Z8/CmkUWgyq7wNmwvU4u/8A4J4PwpYKg75feyIC8xyzZkepGKtOIvCHnxqsTbIjN9KX98tcjJCGiHDorhKpflQC7UviaZRdrkXURBD0kn5fqWRDtrif2W/bvitQlNhCqCsEuHJ5LL5838X/5B9cibWmOBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=Vc98fKag; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="Vc98fKag"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso4018308f8f.2
        for <spacemit@lists.linux.dev>; Wed, 23 Jul 2025 06:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1753277142; x=1753881942; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/jOFjaGN3CsVqLePSDjEetRndyZpxQTsvQQ0tgo6UDc=;
        b=Vc98fKag0J4w9WpBHGO9Dxye9gJyiolFfZxXfKR5r5CXB/VhWB4w8uL4dGOCeEDjvj
         uBt5N0k6NaHd3f6ShRwfjxtQzKTtATszeb0iX3P7AVfZXlVSHHp/eNhSTcve1RaLPCny
         5Ohc+WLRtdNxyfcWDBT6MAjxavrXLpdyCKOwkr7THuMHUpZuRZIl78SHVpkSMQrlcZtk
         Cw5pEV4eV2q3BFIK7enMXtP3m2bJobvGcqAhXB+2pk65kqCVL2h1Iiz2Ib8rLiYI7dmY
         +YSVhJYkxNTtSlJ/m5sII5GAzFhfd2N9Sy4GTvj55hI30AW6B3AwbQLRHPlN9gk+yhsM
         hAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753277142; x=1753881942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jOFjaGN3CsVqLePSDjEetRndyZpxQTsvQQ0tgo6UDc=;
        b=OaqXLl9OeHQ2q1LsDdK/06RtoEwN0qO9imd0Js25QyRNGB315AIK9gYjnK1xKorMuA
         jeL2BNlV+hEfJ3ZAzaI4ZXTcbHSduFEFWH7gs4T2Ng6cLcbopoBrUE4MFbxAx3yd9uco
         OupAfmXF2DWxMDPLC32VrVfin5z7ouPLUwVje/fcVdGaqcCr8EbHiT11OSCpIpxOZFgN
         GF8oxRqaqv06P9JqkYxu97lE+K9dfVbKWaHLHrOvknFJrOz5WJsdGSmECJyztHRThft+
         tLYRoT2PxWiFfrHm/0Lxoy8+3mZljmrE1dFGjr8Jn5xWDaWWhV9nt0/tyC5JgRq+LL3N
         6kfg==
X-Forwarded-Encrypted: i=1; AJvYcCW0U6OLnKEaYnPLRMnfkJ+AC1tlb+jLVWKYI1RJwUQ17/Ob4ieOWJ7IDw7GfFbGlnL0KStGYRsj7A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqYCEf3Rxa6Ww3JsLYR4DsNKqORi2ARqEbvSjGwvlhEvuZnHvG
	dP96JcMMLKD8gRuK/cuj9ESJQLLZ6j2bt1pofKmg2FPYjSkekAiytun4MxM/96FtjvE=
X-Gm-Gg: ASbGnctYYYk0Qa1bcA5+esFXs5+ndBoJKRD1+eRSvpDJH1V/9M4YxB4lMVV8fmhEvvy
	Nsr20H1KQaUTT9EX1Yba8EIZgbvSJBX27ttlu+NtUCJC5oI4szOfUHDiT+Yhoh0B+PCNBc7MDVR
	M66HHQMakCDq18ghG72BEb2LdJh1f9CyEYZeZFEvrRZCL7JAjHVKcxu2AV1fHQdF+NP5QJSLqb+
	U6Xe94+QeUE10vILQY9TooimSPmG1jd2DYG85x2nSxOwstebh3hPaeJV9rfgv5gmBoX3aacbM3e
	+AOyA2wXAira/rWOTYb0XX/Jm/BwZx+LLZ/r1Rp92FQSiyHKeFN+rQVPbmps9kRJ4hazce0/SZ0
	03wC/L2vRFc0XjAhK/I02Wo4jsH1b4829TbpQIgodUDWJk5uoDA==
X-Google-Smtp-Source: AGHT+IG7lEmEEOErHvtFjRdp4cL9IAeiY0R7yViDRurEsfQTfNPWbZmrOYW259gPKET6e12uFu2ovw==
X-Received: by 2002:a05:6000:288a:b0:3a3:67bb:8f3f with SMTP id ffacd0b85a97d-3b768f16391mr2725907f8f.53.1753277141746;
        Wed, 23 Jul 2025 06:25:41 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:7fcb:5e01:8f11:1009])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca315basm16320109f8f.39.2025.07.23.06.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 06:25:41 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: sboyd@kernel.org,
	dlan@gentoo.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v2] clk: spacemit: fix resource leak in spacemit_ccu_reset_register
Date: Wed, 23 Jul 2025 15:25:04 +0200
Message-ID: <20250723132504.66273-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function spacemit_ccu_reset_register() allocates memory for an
auxiliary device. If auxiliary_device_add() fails, it skips cleanup of
these resources, resulting in leaks.

Fix this by using the appropriate error handling path.

Fixes: 988543522ebd ("clk: spacemit: set up reset auxiliary devices")
Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v2:
- Properly place the Fixes tip.
---
 drivers/clk/spacemit/ccu-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 65e6de030717..5bb85e32c6cf 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1059,7 +1059,7 @@ static int spacemit_ccu_reset_register(struct device *dev,
 	ret = auxiliary_device_add(adev);
 	if (ret) {
 		auxiliary_device_uninit(adev);
-		return ret;
+		goto err_free_aux_id;
 	}
 
 	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
-- 
2.43.0

