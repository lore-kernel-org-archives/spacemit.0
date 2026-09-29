Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A163A51B18F
	for <spacemit@lists.linux.dev>; Tue, 29 Sep 2026 12:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683449; cv=none; b=Iz26htjc+yLIoGi8Q2OYv082nQ3OQYEHzM24PK3z5ukW70ezSGWkpbZoE9vZtd39hN0hKl9zwXxcSN8IfNFJz9OjdsKROZtW3oIe3uUAqh4QytoIW3g1mYkgaFP7EH4+O4WOgAA4q5pMv0FkkQ3LmTN7RyMb61SFILpTsrHdhsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683449; c=relaxed/simple;
	bh=CAOqvt2/eZ53OlhurfSmnHSmFP9lsKwEDk2dEwHxoBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=fZKv5SscO8ZLdh0NYZmy8Us2D9QBmK0j6WsM8+7+7wICfLD1gIRsT2l+qHxqiBXwbAbuAmtizQFCr/4M9gupsX/mqxpipyCN2sRM8d/Twfk8XB8/PsTlcEALNaj1diafAwxEjRocKXP/X4vcE2vZizAzijYtRqqiWLzO1kYKri8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IY3A+m5J; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IY3A+m5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790683444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9cJgdJ7LhmXl6+yqSKNaV6ms6joh7PI+1Jj005bKoCM=;
	b=IY3A+m5J6V0Q15jlJUuZD2AM6+7k57MP2zGKoJIw2Y30CcluYyBOgdP0CJVPuJi60vyG5h
	aV16y1vKOj3FvTfpVanltYR20x6wao5N4e3uQaptsZtc9KzW3CFCVUDo2n6PYmPiUPkepx
	XRSHA73EMVbXqgD4mDmflT+hUOFn7w8=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-HsCChmsFOIaQAKqm3_tUUQ-1; Tue, 29 Sep 2026 08:04:01 -0400
X-MC-Unique: HsCChmsFOIaQAKqm3_tUUQ-1
X-Mimecast-MFC-AGG-ID: HsCChmsFOIaQAKqm3_tUUQ_1790683440
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c83007a11cso1313431e0c.2
        for <spacemit@lists.linux.dev>; Tue, 29 Sep 2026 05:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683440; x=1791288240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cJgdJ7LhmXl6+yqSKNaV6ms6joh7PI+1Jj005bKoCM=;
        b=RoBIspsZ2+1nizytOUtCjhVNuqIBVn9hz1/WN/IDYLwTJsPbeQn5yirwFlhEI2Weth
         wtcAVnUGl9LWo77ZP4sTZawfaSJs8sye/O8+KE9ZSR23KKpjNYn/EfZ7+DMLCus/1Xth
         Ir5ZIhJIUKCotcB7QVzrCHIH9KSWbZGhcvxU6tLjh/PZLp6BdCxdorWrpTEntbbvLe4Y
         0EClVt8zTBz1ndUEsi1Lg4NULvD75GqTWFFJk4HGdJGLxy4lAQnCBAEICQN6FShTOVEH
         HJLWjmxAUmeF6hKlJAGWpjZibjIZbbyPUfbtCkB3drPFf7tdgiFefwYz2nk8Vc1hEs1x
         aeBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoJO0LMlkgLlS5yt+OOa+lG6ycSuVXFUvUhLdpA96h3z3hSOHYpSLi55pmiSVCVN/BUTSGiQtQsg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJsSvsnrw2RaVCzU8zuGFT9x1npDTaDJ+jXtC1M0DHfTqfdBB8G
	9eXsHyNIZc2SdGTqACMW768jM/xJYcXxWUUwJv5gqeNSpxpAuZN8yBiDnnVfLXw4aBJT2VYZ4nX
	RCi59O9fqlOWfbBN8t5M9SiOKEGKu8zuFyw0GPjnp3ArCG3gUJ4eBugJhGNCl
X-Gm-Gg: AYBFou2BRSL+Q/Wqo3m3r6V9VnXPP+vpM0cFR2yHHisn1Q42f2N7m0jisAT5VtwU+RJ
	h3YnvA0O8YapPK7RBCZS2vU1qAKKmBZZ4+96GnZV+NbS65jrtRwCvYm2EKqmy4/Pt5ObJSiBTfM
	u02W+2eNSIRlonUHoLVoFzPUWulAzHKOnK5RfmJwpWlThpY/+7OGhJMWzJlzAcMYM3SbuSb5P/x
	YSon5Z1S1VyZ2scMQqc2qOqX5Hx+anlktVr5eqQJBb72cl3kzWUdFF9a/BgmS4DPuXc14hqtUF5
	lOXieQm5tLOK+hFNyhlJh5A76tM8DTLM0jzPGRf+EtHEegPnc6QVYg==
X-Received: by 2002:a05:6122:1d06:b0:5c9:a610:cecf with SMTP id 71dfb90a1353d-5cb0c14ae0fmr6920987e0c.22.1790683440608;
        Tue, 29 Sep 2026 05:04:00 -0700 (PDT)
X-Received: by 2002:a05:6122:1d06:b0:5c9:a610:cecf with SMTP id 71dfb90a1353d-5cb0c14ae0fmr6920964e0c.22.1790683440083;
        Tue, 29 Sep 2026 05:04:00 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde4f99222sm12410835e0c.4.2026.09.29.05.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:03:59 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jennifer Berringer <jberring@redhat.com>,
	Vincent Legoll <legoll@online.fr>
Subject: [PATCH v2] riscv: dts: spacemit: set console baud rate on OrangePi RV2
Date: Tue, 29 Sep 2026 08:02:27 -0400
Message-ID: <20260929120227.1791356-1-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lrjWDhZIloeMzJd_PDW5Edo-iTEmLEBQ-Wn2dfjOZWg_1790683440
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Set the baud rate to 115200, matching what is used by U-Boot on this
platform so that the console is usable even when console options are not
specified in cmdline.

Fixes: bab8dea259100 ("riscv: dts: spacemit: Add OrangePi RV2 board device tree")
Tested-by: Vincent Legoll <legoll@online.fr>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
Changes in v2:
- Collect tags
- Rebase onto spacemit/dt-for-next

Link to v1: https://lore.kernel.org/spacemit/20260520111150.3300707-1-jberring@redhat.com/
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 0cf60d1985604..d8b2cace4e7a3 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -25,7 +25,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	leds {

base-commit: 4947ee60bf48caddf5caefc08dbbc84d09fbbc6b
-- 
2.55.0

