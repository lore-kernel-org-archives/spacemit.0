Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E6A126C13
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 15:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744386268; cv=none; b=cRMnhHb9OI/KvjIt4kHLCQJMa9GzC4XFZClEKC0psK8Lo+ZewDcXwGVL2NOGDNP2mGMvyj8ACg1FMH0fK+K1ml95QSb0T/NieNi8lwtaL8BIH9k18qDUQ+KMxyMNy4k6ZBVAI9K+HqTMgx/SR3GFznhnrsXMgkXoYGcfFIsUD6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744386268; c=relaxed/simple;
	bh=2wgs8xkLPcDzrMkx5fPptVOf8gKg9PkOJJY3p/JCOtE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dlbxfhgnZ601mRcvnUyJ7IWMy50YeYPq8YVzh43K71ThgjVj1zBvqZ463iOt52nHJCNhn3RCyvOtVPWhrGdEPynVGCEGKU4dqicHkGCjar1Hc/7z0SPGboZ3+gP/R1qt3ZsHddeHaHIHr6iiwyObNgbxN907N09NpIyrfbEG71M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=YdfpVGUk; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="YdfpVGUk"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d434c84b7eso13908415ab.1
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 08:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744386265; x=1744991065; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2r1c/vOhjgtnKBMGLqUCUilpq9yxWP4WtszcGjN9x5E=;
        b=YdfpVGUkDdGARDIL9mmmGjK8Crm0TlZFDZnGEyqePUhlDKopsudgBWuSyx3fFbX9IK
         OWd3uDlbiGz2YprZln8QluRPMWsvJnPHYxGbZdjkJm28Mgf0VVyLP1h9m+soPXnWCDMT
         ktMEMg/MukQIILyvM/bQhH0qrQ55pCJsL+5q3J0pqEEelWLabQvDqcU57e5TytZuVY7n
         fykYd8L/2UL8FqxdgIXHHFcWJqTA/Bi2mEjT7iZ51gHe2HwBV2ULzBhTXhs050oZ5GI8
         eewq6moxA0BM12852oq20RKITLQKAh4IxPataItlFBd3eW7DN6QqVUzcZcf5DyLXeM0T
         XTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744386265; x=1744991065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2r1c/vOhjgtnKBMGLqUCUilpq9yxWP4WtszcGjN9x5E=;
        b=PitEZoiS7PZai6iH/UtCNnDU4h6Ivg7TPQVcX7h84KCug9raECHe6dUBDGp0mkpCYg
         6nXT300VhYSbmKEgeWuOcSPWnJongmUrLCLVfvM99iaB3AQVdovm/u25A2D/MK9+NJLh
         nkEdzUOwYH4/G9NkOcEE1wGghHpYVi9HD/n7zyh2zjpH6jpyXOXc7Y9OSwh+h9vq9GQL
         sA53qz8ZQt7g3Fw+Dn0moYO44leh9iTrg5qe+2TrlhzSJScuzcVF3eDhZ/8fuZDMENN1
         y801BXtAi65EkCA7lOwR5v1Y58C3nQVdq5iYGrNuAjDU/fOgj9ijpiEIN9IMFCK67vRd
         +7Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWlLkKIey11TrvdTeE6bKiMTlXi06Tl/VT0XhAdQZnwdpIE3NI502DwuaOTgCvJcD9AVsS3PbxEXw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0eoHd/Aaes+ObofUoxSeij+S8ttdi8JfQ+ieDWufaGKeSbfnR
	BUg4CzWC9HB7ZXn8WFB6outjYmiQXExHfLnqliZ/eLYLMJIHGCQB+VRcsNlumcs=
X-Gm-Gg: ASbGncsUgscwPf0gx+wXf18X8pNmPOkKgreF5XcwM51d3u4jGGwzjOdnMd1LmJbQHxv
	ExFFPJUOMiGy45sB1H4WFdcO0sjsGBoOd5lhbSaLlhveV3mzACzysI1eidfob43MDVBx2OI31e9
	fEmAefi5JzpJgmOT9lHidpGpVu7uMzIfmAFaEanq+vmbiyV2IyPeO79+kcOTd3Kvf60SRQVKkdi
	ZGN38n/nyPy2ogTZadrYoIQKK5sE9inQVUSxZPj06uglGZjLOKg75Q7RbLwIYvvHN70pOeS3swC
	13VILA5y6aKHofYBfyTHfHI5o0ZyIkq0iNamuaVU8NMfTLjohCB2VPAPtl/YvfgVBed49jPeK8O
	2hXmj/eUYIxRzEw==
X-Google-Smtp-Source: AGHT+IFK5sdaLIBjH4lJHrLTb46aftzH6TysHI0IthYxIBi/kqyaLNxSazBe9csKjIFKMCbouX8yUw==
X-Received: by 2002:a05:6e02:3601:b0:3d0:4bce:cfa8 with SMTP id e9e14a558f8ab-3d7ec1dc7f4mr34974745ab.3.1744386264887;
        Fri, 11 Apr 2025 08:44:24 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf812dsm1276326173.18.2025.04.11.08.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 08:44:24 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	benjamin.larsson@genexis.eu,
	bastien.curutchet@bootlin.com,
	andriy.shevchenko@linux.intel.com,
	u.kleine-koenig@baylibre.com,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] serial: 8250_of: support an optional bus clock
Date: Fri, 11 Apr 2025 10:44:15 -0500
Message-ID: <20250411154419.1379529-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT UART hardware requires a bus clock to be enabled in addition
to the primary function clock.

This series makes it possible to specify both clocks via DTS.  If a
bus clock is required, it and the primary clock are fetched by name.

Changes between v2 and v3:
  - A third patch was added to disable the bus clock on suspend and
    enable it again on resume, as requested by Yixun Lan
  - Rob's Reviewed-by tag has been added to patch 1
  - The first two patches are otherwise identical to what was in v2

Here is version 2 of this series:
  https://lore.kernel.org/lkml/20250409192213.1130181-1-elder@riscstar.com/

Changes between v1 and v2:
  - The DT binding was fixed to properly define the number of clocks and
    clock names based on the compatible string, as suggested by Rob Herring
  - Logic to look up the optional bus clock was changed as requested
    by Andy Shevchenko
  - The bus clock pointer (which was never used after it was enabled)
    was renmoved from the of_serial_info structure

Here is the first version of this series:
  https://lore.kernel.org/lkml/20250408175146.979557-1-elder@riscstar.com/

					-Alex
Alex Elder (3):
  dt-bindings: serial: 8250: support an optional second clock
  serial: 8250_of: add support for an optional bus clock
  serial: 8250_of: manage bus clock in suspend/resume

 .../devicetree/bindings/serial/8250.yaml      | 30 ++++++++++++++++++-
 drivers/tty/serial/8250/8250_of.c             | 13 +++++++-
 2 files changed, 41 insertions(+), 2 deletions(-)

base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
-- 
2.45.2

