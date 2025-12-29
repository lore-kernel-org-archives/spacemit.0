Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF982E2DF2
	for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 11:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767006269; cv=none; b=d60ao8KHWTbgbRTdY40F1nGF4cmZDrdSoEAGlS2R5gaCxpMG2suEAEkzHgs/we6GyCz+DJLqB2/G/wja0Rqyrj/+XxnZVXpurjQ13wEJLNYihS9lnXg5Y3c6uTl8FtDAN1sg3KEyOsokSKL+hFzXXr9GyQm8PcWwsOOrCNG8tQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767006269; c=relaxed/simple;
	bh=ktIWwmpfHqKVnE2olidD3WpkQg0kxx8RJ8bXuIa1abc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ESgKtGq49F0QCHwOMHC1nrk1MZjKGe5J4TKUqYtmeBXK6FfOy+eegAU2DxuVUYeBImXyfvpXcadDX6iBPlfzsF3cjmEBMYCCcd8Y2SWScULJhkPl7az+FIzMFRfR85vejRgcjdJhOmQ+DlLkrzN9i+tVxQXkbcpfCjSOSF3EvTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0jWEiv/0; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0jWEiv/0"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b75e366866so3952203b3a.2
        for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 03:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767006267; x=1767611067; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lUNSVe/sd1lYKp8l9IYubt2NU/sufakOfvhG/jIITbo=;
        b=0jWEiv/02whyyzExHt2QUe48onk59vaXRHYjlazXOhxOBkQbiLDC9Eskd6jyLMvme+
         jA6+Ze2uOVa/ZDQdcJiXq1aqTWg1Imnlo4izUhHG/HPml8hvmamge9ym5zlxPIodAXAT
         79HdpEJKf2WKzaGrevPSn88Z5Jm20rVny9HN+WaZXtxYbvqdvy4/WBvOa2QYG3nWvWCF
         b48eNu28pMZAbr1sMC1u+r4R0E0oDgfBDyxgQV3jnhS+PMlM0WvMgWLwHZWwCO5m0Ah0
         nEcQcfeq/llN28+Dh7g/6+rEJQEyOazg4jZl/aaFueI3ewljvVF2SHwp6c8c9UnXYZBE
         TG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767006267; x=1767611067;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUNSVe/sd1lYKp8l9IYubt2NU/sufakOfvhG/jIITbo=;
        b=dj2U2D8iqAH42iaw8J2WX+cid81wEXWnhLfnGsWZXgHs1Xy8xpIxEDzxzx54sIfzS/
         fah+syODOUChWfUCjwLPWbtrAE5EtQynmkhRpeqUXRsCE1vbIDWJTyGn+YKEVmwzJrkf
         aUqa4AYFB7/BqKkY/eQ4743PGtopaLOa6A3CLoZDHKzfoZcjjN21gawuOqmMgZIDVDZE
         Cfe354w6nsvxZ3ncW2VEjOu2q5uq631uHtcbBMqBrUZsYcYuhv+Xg3RuclI2CxuZlbVi
         8sQHozvvbgb9OmLW+K6xfvKq6Qgl9I6h/PSBpnw1U2XI9yf44cueE3KsICdfe1HTEMb4
         kj2w==
X-Forwarded-Encrypted: i=1; AJvYcCWRQlz3U1I3W1v5oQbGYlQqYnlz8ETVp2zDQKrmQ0t55tOYxyS1KBMoBpDlRPdrOpOT3UeoviCryw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLyZsJZlcawCSBnTRZYAnq0rShvsZ2tGiSr9l9nnQPRINu0QGm
	8AcU+g5lq3PzTWgFYL8ub/hl2WRoOXUjwtlkvgp8gLnFpZYNrGEoQTdV5Q8fxpOXZtw=
X-Gm-Gg: AY/fxX426lE+hpQ6QE3KaS3mqEh9NQ6zJdJ6dtLVU1/3jRJG2fDoRB5vd/NFqw1vxSS
	Swcwvj32+YIyjxWqGlobA5hgeRHzrbRbwKCgUHD09sdxF+KaqmQfucsyIHYPbNYs6PREbS692Tq
	2JBRhAnB9LZEUOaRBODZKf03tuYq/1x3VlPiexhS1znfDjiMW0Op8bvWIXhaNnbHH7KSSQGFRia
	Y75IgF+0rzHHISc3VFoCZy2rNExmiGfWGX0IOLnWCnda1g479yXH2W9fD9/z5kKEtWbbb22yRSG
	CsbYT/u/DBNdz11AJ41cBx2XyO/Kg6St1qYPa+nQNPs7ZMkTGRD0T94LCT1Agwj8ccCwiDMomzN
	GUabaxv7SNAPTX2nTXgbKGmojC827GOmX3AxAHxIhDNViWauFYEylKZ7lSJxIwSRhbFmkYKOu77
	Z94HCGdIrG0q6aK1Tk82NRND9Qb1HQ9eU=
X-Google-Smtp-Source: AGHT+IEBHFLAKZFYMyyqorMLa7esl33p/rcxioC0H1BC7C+EyM+BB/PbnfCpeJf/1UDq9wdwVE528Q==
X-Received: by 2002:a05:6a00:438d:b0:7e8:43f5:bd5a with SMTP id d2e1a72fcca58-7ff67852a95mr26500403b3a.70.1767006267092;
        Mon, 29 Dec 2025 03:04:27 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40d7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7aa32916sm29338817b3a.8.2025.12.29.03.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 03:04:26 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH 0/4] reset: spacemit: Add support for SpacemiT K3 SoC
Date: Mon, 29 Dec 2025 19:04:03 +0800
Message-Id: <20251229-k3-reset-v1-0-eda0747bded3@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACNgUmkC/33PwW6DMAwG4FdBOc8oToASNE19j6mHJBga0SRbw
 tCkqu++FG7TtONv+f8s31mm5CizobqzRJvLLoYS8KVi9qrDTODGkpngokUhFCwSEmVaoR+VObV
 Ik1TIyvpHosl979T75ciJPr+KuB5D5ilnvYtD9XqAqDiKHlXdNFydBCC4EO3Vaa/Ps9fuVtvo3
 578H2XRAe9gQbC3BcqejwE2ARxEb1rVYG+acTrPFNYY65jmf5zy1RPZZGl3XFhS0pjOyt9tozP
 tp9w6VFtXo4JkJbs8Hj/iFgI7SgEAAA==
X-Change-ID: 20251229-k3-reset-8d9b751ef391
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3

This series adds support for the reset controller found on the SpacemiT
K3 SoC.

The K3 reset controller shares the same architecture as the K1. To
facilitate support for both and future SoCs, the existing K1 reset
driver is refactored with the following changes:

1. The existing K1 driver is moved to a dedicated 'drivers/reset/spacemit/'
   directory.
2. Common reset operations are extracted into reset-spacemit-common.{c,h}

The K3 driver is implemented using this common infrastructure.

This patchset is based on v6.19-rc3 and depends on the K3 clock drirver
patchset [3] and the K1 common clock work [2] and [1]:

Link: https://lore.kernel.org/all/20251219012819.440972-1-inochiama@gmail.com/ [1]
Link: https://lore.kernel.org/all/20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org [2]
Link: https://lore.kernel.org/all/20251226-k3-clk-v3-0-602ce93bb6c3@gentoo.org/ [3]

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (4):
      dt-bindings: reset: spacemit: Add K3 reset IDs
      reset: Create subdirectory for SpacemiT drivers
      reset: spacemit: Extract common K1 reset code
      reset: spacemit: Add SpacemiT K3 reset driver

 drivers/reset/Kconfig                              |  12 +-
 drivers/reset/Makefile                             |   2 +-
 drivers/reset/spacemit/Kconfig                     |  36 ++++
 drivers/reset/spacemit/Makefile                    |   6 +
 drivers/reset/spacemit/reset-spacemit-common.c     |  79 +++++++
 drivers/reset/spacemit/reset-spacemit-common.h     |  53 +++++
 .../reset-spacemit-k1.c}                           | 113 +---------
 drivers/reset/spacemit/reset-spacemit-k3.c         | 229 +++++++++++++++++++++
 include/dt-bindings/reset/spacemit,k3-resets.h     | 171 +++++++++++++++
 9 files changed, 587 insertions(+), 114 deletions(-)
---
base-commit: 82791741762a870f5f2ede9f909301770f66f867
change-id: 20251229-k3-reset-8d9b751ef391
prerequisite-message-id: <20251219012819.440972-1-inochiama@gmail.com>
prerequisite-patch-id: df430730ed961011cee5c5d47b7ace84b3c5ebb7
prerequisite-patch-id: 64003618c33be925602e46b7543f2c13d3f36474
prerequisite-message-id: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
prerequisite-patch-id: 478955b6a6ab7c82910cdd9de7caf2d8be95b99f
prerequisite-patch-id: 9d9f553c3430fa2bda0e980679efa60c46cdd8e9
prerequisite-patch-id: 50eb74bd253e779458b52b242144e79807675461
prerequisite-message-id: <20251226-k3-clk-v3-0-602ce93bb6c3@gentoo.org>
prerequisite-patch-id: 5c03cda3a94467833d7d6c97889edb2909a8377f
prerequisite-patch-id: dce85ac6e4e94b1d2622a8231ddab3de766373ff
prerequisite-patch-id: af1fb571f0d19d72e69dd41d15fc2dbd730b17c7
prerequisite-patch-id: 96f735ba6592797c77ad17568e9065b285dba453
prerequisite-patch-id: 2fdd0abff5d58f5c99646ba00f82d81672679796

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>

