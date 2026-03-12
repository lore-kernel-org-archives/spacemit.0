Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D968C35F612
	for <spacemit@lists.linux.dev>; Thu, 12 Mar 2026 01:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773278617; cv=none; b=CDXvmbatBNGbU7D9tYUALqeqJHsVrW/xHMccJFlMDQmqdO1V7nlwSCumcfFaepAnRSWD4XCZG4tc7blwA4SmR4UK8WXpw/nX9fICIcFZeO/dKFp58uRvQ87I7wqHaNyonVSFfEnmONwpBQzspxojPKLVX5bBh7KD5sBzc6PzyOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773278617; c=relaxed/simple;
	bh=3McREo9Kk2UYPLjGgyLNM8Spss7Ow8fhuceAlqV3l6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n01pbO9yiDAWf1O4eoH6McI1/gzddSMCXv0bqH52gUzJupHuySHJaE3NF11QpePwCVhR0fSrFamtksvh3FVxIeBwTt5btZ+2dSmhZwtVXtwOTpy6BP9UK6X1evpuGRLnXFIvgHzzCdPBjV/1fWeEm/uz0gqOJyCmG3NTktuBECQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=diaEYF2D; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="diaEYF2D"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-899fbf92bdbso6132696d6.0
        for <spacemit@lists.linux.dev>; Wed, 11 Mar 2026 18:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773278614; x=1773883414; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iB9g5jx+x167tNjxcGl7Z3iDMBhQp91ckzQQIEVj78E=;
        b=diaEYF2D6toxLwEZudKaF6MFb9eLwdPd314eS2XkDlPS3hiyfa8f8+sG62h35MODqA
         EYXNaC0x1vHSCOFI4oBWzlqOdrCaGePUseDXYq5XOa07N4ARHGthOS3ZFUrVBXfZzV5/
         7x33ZUgcdUu+A2c9zH9vvoKmTlpFdcg30Ux2Fc5tP5x8ZtstmWhbSQotgR/660s9e1pn
         kn5AFIEO/CFIuuN4I3rpVpkUclry3Tid8T6qbV55Xw2a2xDGjoh4mVxfxU3QG1QEXkwS
         zcIJbZrNw95ANBY3VxkvTfzbaEMKcrK9pQ/CD9gHjnjp2a3EgplX7xzM1jMzz/OzIv6K
         5E4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773278614; x=1773883414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iB9g5jx+x167tNjxcGl7Z3iDMBhQp91ckzQQIEVj78E=;
        b=ptONR6kioxldzv0s0vmq6rrWeR8e1iDNNdGMFeVdbMQjXNbZCG5eNaDhWlw4YwOGh5
         BFGzoIYIS2dDPmYt7mCtEI3N3LDihlIQLxgCEdlaXMsWluqda7uMR+HWglZI6/5/slrh
         bgPyQUWfarenVt7mSYSTdPO1iw4/JZ09F4M5hQw5Lt46Rjm+ynDtujVKxBhndthDkzZe
         vFiG7Jh3cFIp1gtVzmBlD7wfdMQHjMunzUyBVY/9Lt9evfRRiwmx9ZxX77d8rb7tCg7e
         NJ1RvUrzC9tnagwgOK1QBFcDdUw/gmYAkYRDexLzlYJDnX5trkhz6fiJfS/dby85tPg0
         mjXg==
X-Forwarded-Encrypted: i=1; AJvYcCV2FE5+srLQNIH3jUoQwfhfJWwE9dwl+igl1dQo+7vbp5iz+NriUvhX6IresCb6hHeAgrKdQ0Lcpg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlMRtE9UNHRhrtiJcc54dOhgauOWJYUikmciL1FyRBPpahRj0M
	M37tDY2SsECGem2KYyPf1DMTtmi3BCIiMueRhA0lfHrm4If+qwzDsncA
X-Gm-Gg: ATEYQzxhjvJndSvdQJtMgna3OC+KltpVBLWzYCBboXSpLkv/r8NttxzuZx2045yi7Wn
	8DyJLA/Yq/4Q1dnkHpU4/aK755zrlsj/Z5TS91kAQgAQq7KoRStrl/zzUju+lmN/7z5YTgM4aK0
	JA7i+a+MNfL/+Kj6luCieqnlgkens8px+vgbWSgO1l4knthp/vaBlqf2aNiA4yNrCTFlzJZg4E5
	bt7xQW6R6kUyDV2U2hTDBEz+3+oTI+wjaMCMey141j9yFGK+N1f6leuv1VO1cj4Hh/+WQRbGy4Q
	xbXgqWoDOESI1zB06KutMuvyxycuTkmt8EIcKU24lq0rur2RCVIOewlsoq8FR6fHaH9gV+ksssj
	24IRcOvImH2cZR0+lX28pmMoa+zvX0lG9zdV75Ogqp6J1Bk3E5uXccb2QdLmcVD3su30rKix1qi
	V6em8WIHGmXtzW6Bw4O/6EVvEKm1dcLszT2g==
X-Received: by 2002:a05:6214:2305:b0:89a:717:1e48 with SMTP id 6a1803df08f44-89a66ae1ce8mr61425926d6.58.1773278613817;
        Wed, 11 Mar 2026 18:23:33 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65beb4b3sm25165286d6.14.2026.03.11.18.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 18:23:33 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v9 4/4] MAINTAINERS: add entry for SpacemiT DWMAC glue layer
Date: Thu, 12 Mar 2026 09:22:26 +0800
Message-ID: <20260312012232.373713-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312012232.373713-1-inochiama@gmail.com>
References: <20260312012232.373713-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry for the SpacemiT DWMAC glue layer driver and
its DT binding.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2265e2c9bfbe..dd72d26ac837 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24834,6 +24834,12 @@ W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/dvb-frontends/sp2*
 
+SPACEMIT DWMAC GLUE LAYER
+M:	Inochi Amaoto <inochiama@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
+
 SPACEMIT K1 I2C DRIVER
 M:	Troy Mitchell <troy.mitchell@linux.spacemit.com>
 S:	Maintained
-- 
2.53.0

