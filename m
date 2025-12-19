Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA1F230D35
	for <spacemit@lists.linux.dev>; Fri, 19 Dec 2025 01:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766107774; cv=none; b=Z8xKY9+G/Ca2lZNSqqTJlkF1p/mQSmAjFnOvE9ob6FpjWemMwrM/eA/4j0GQvfvP3s4JtGtIHcTg4Lok3+cuIiTF/wtHduP1Gyt0ahpx337/yfgHfpSP0CKSOxZEZMu9KQ5v0jd/DLcqZ+Ru2j1t21hviIHsRIHN9n/qJimpmmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766107774; c=relaxed/simple;
	bh=coBhJbOTPb7tUUz9onsZhOwWKYw5Qqk4KBE6SRHMqXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bth8GHNwtOKCtROI44+/EbaKtCq2nAoRansyDmDqZPrZFl6Uh9PXO0wlTg2RQnVfYeE7FiygQGI9Cp++3uppTvXInVIaDCHNhWY43QvZHNm+vN/+lnE2jq9IxrONQ5c094EjuwFymCv6fiFHFrN53NsxlwVDKO9btJRBgPo2JUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0lmOIb2; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0lmOIb2"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0bb2f093aso12897405ad.3
        for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 17:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766107772; x=1766712572; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQga6H56NgMAhDmuMLtpPzFbNPail5D+bj27HRwKHs8=;
        b=g0lmOIb27rL+eYEUcACCsAw2/svs2I9oP8+VAV6R3ieALS1v8z3vbYZR7HUAnowuaR
         oT5HiIE7M7+HLaRDwqT4GTESgoPm9i5zdq1oLFqeAuBQKx/wiTFVIZaOInhI/yZDsgh3
         SkwYFbPDbI8uaslCMfd/UvX5LaCwicM3dNEUd2hH/F4cQW74oAeChv7tNqrdEw2oh9kn
         Ha7io79t4jRVS8ZrgmRA54eePGLhf8EFuiaSdM2kCAn4ch3yFOMSfnpvIlBuX2JOUFka
         LNFJTcNQEXZXXHOllNPa+xltnN2r5w++4WpxxjiGwUAds6jHGZll34WCra52KynxsLX9
         K6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766107772; x=1766712572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UQga6H56NgMAhDmuMLtpPzFbNPail5D+bj27HRwKHs8=;
        b=dfS9f8sMbScRhpyxSeL3ZCYmnnZA+Z2e1Eqgyaot6+vG1z85I1ApqK/xvfHkboqBY3
         z21SF+7DmqhcPFGQwwGU1/YVnOJOwoiJqefu508J53gDVGrOfODZ+2uyN0R/z0Q/JDYv
         Jmn1uHTm3KjKXfNPHy0lruEiKe9hSfEU9QPBxyKiOZ4XO8eeLADrG8luR4A/aZJSg609
         lf1teRm+RB4Nx1EllZ6YQY+HhWpSWPu8N6BEP2JerWXUlIi3mudsgf1OYejnf9vyKPEC
         Rq5BLv7crqc8LeAuHMdKmNbrUaCk3crnMB7kwzvpA0efzjSll51FdaMYKpu9vgEq45jD
         wsfA==
X-Forwarded-Encrypted: i=1; AJvYcCX1mrmPlYSOpvtetrQsp5Q4fAYUUq63dKq3ulXXtI4rRr2wPyeq1s8Y95SiYt6p++fvHA+S+T/Mig==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+D74M+Z24cZh6xVITwJZEzQc4JA5FHASvOVg1oIUUqZeMMsqD
	HuJ5tuQ9NMW3zHmI33YXmLILSqGuN+OaM+Stj6UWL35p9/t4R3sLhzx/
X-Gm-Gg: AY/fxX5pWSjbbWjJUHWl3hKiOvWTu6/UrKF/wNNmp/CI9uvPvy5lYqr72cSqxx2GiQG
	u78DrN30+kFoLPWQBKEKTqWPehXwl7dZu+GUHn6NIVN8QPQfHeT6JFRsr86pe69zFkfvAfWXYPe
	AOZwJeTH8bTrOiGU90MW3uG1s4DJUWRG2cbff5hA43BvfhJtYyXMGEbfnAOh1WUWHqiu/ZwZTlH
	vpsSCtUqWWUYxMVKw80KN3P4FjdGU6qQLF53rwaLLZQ8c6N/XSMQ+SwvrLsw0jVq+OGX0CEwb9N
	TkF5EMdtWZlT6PodZzDvXZ+svI9mcOoJwhBjaxJr8a6xod243oiLJHbCSktzul1yD3yeYKt/OtN
	dvLIrdxQGeFzeDD/faQq+hye7IbySWrgU17o8OeRNhsYaM/R27f++tXVgtqverTns1UYOCYMXZk
	tIB9ewiWP0FQ==
X-Google-Smtp-Source: AGHT+IHMJ6kEWYKA6O5Q+cLJMQcvpcOIDvA3plPH9xUduwHOUSXGLhy5v5hS/sYcHwSl1ox8HAe/gw==
X-Received: by 2002:a05:7022:b92:b0:119:e55a:9be7 with SMTP id a92af1059eb24-121721aab58mr1352297c88.3.1766107771841;
        Thu, 18 Dec 2025 17:29:31 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254d369sm3053035c88.16.2025.12.18.17.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 17:29:31 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Haylen Chu <heylenay@4d2.org>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Brian Masney <bmasney@redhat.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 2/2] clk: spacemit: Hide common clock driver from user controller
Date: Fri, 19 Dec 2025 09:28:18 +0800
Message-ID: <20251219012819.440972-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219012819.440972-1-inochiama@gmail.com>
References: <20251219012819.440972-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the common clock driver is only a dependency for other spacemit
clock driver, it should not be enabled individually, so hide this in
the Kconfig UI and let other spacemit clock driver select it.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/clk/spacemit/Kconfig | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
index 3854f6ae6d0e..3351e8bc801d 100644
--- a/drivers/clk/spacemit/Kconfig
+++ b/drivers/clk/spacemit/Kconfig
@@ -1,19 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+menu "Clock support for SpacemiT platforms"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+
 config SPACEMIT_CCU
-	tristate "Clock support for SpacemiT SoCs"
-	depends on ARCH_SPACEMIT || COMPILE_TEST
+	tristate
 	select AUXILIARY_BUS
 	select MFD_SYSCON
-	help
-	  Say Y to enable clock controller unit support for SpacemiT SoCs.
-
-if SPACEMIT_CCU
 
 config SPACEMIT_K1_CCU
 	tristate "Support for SpacemiT K1 SoC"
-	depends on ARCH_SPACEMIT || COMPILE_TEST
+	select SPACEMIT_CCU
 	help
 	  Support for clock controller unit in SpacemiT K1 SoC.
 
-endif
+endmenu
-- 
2.52.0

