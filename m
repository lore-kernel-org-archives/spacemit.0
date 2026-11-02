Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599236;
	b=5NKSrJQYkfrQtY7xjd1YzFuZbt9TBZwaBG80SAanCR0RPB4CCQlL1Fhyz4C1/kHTB4Uc
	 xMMgNBoHZgjfTmZlrrvmxwXTN0Ui+S7nEkYwoTedscy/qvxR6fKW58/LHRzxnTiDov1zy
	 2FDNkVVUoJaJceVtzUbg2BEk/sgdtMa1XGtLijHxjOAj1aZJiEEbhS+5qndNDlJV+tJYE
	 5OEl3P74qS2RUJ8c4CsYvN3bKPsQ673tEZxukjrDcgwF9OZ22M23l0kO9sRb5eiMbzxCe
	 8OqVcQx/yyS/iXR/Oz58b5ZX/t3UZV0ifVPezUpFIst9YaBrjV/8K/CmWyNgZQyx2NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599236;
	h=DMARC-Filter:DKIM-Signature:X-Mailer:Content-Type:Subject:Message-Id:
	 Mime-Version:Received:X-Original-From:To:Date:
	 Content-Transfer-Encoding:X-Lms-Return-Path:Cc:From;
	bh=A/tLJoR6OHH3WDx1lVKoWYGKHOjQjb/b8PFhHuwJhxc=;
	b=w2Uz0LRQf1e7zmwfWwbm46rKQE5zhECMSMsy4DUEGBZ8H/nRpOjq8gQ/7GH8GMMCW7Gf
	 3DYE6yGaaQRi2ByqRyqS/j4E7LLpWlM3SBxEu2iJPdkvpfAAdCosjSiA1qPbGpoFm6bFm
	 zZ/vuAJ33yH6d0Hi1ICSvrJXxyTb6Ewwgm828Le6xMFv96QsCjmEVIjAFm3o6K1ETO7Ku
	 dRFYDwG8BfAq57M5mlq60y+ejz7WsMkREcCDAZIMsMErNnRX/i6zdOqA0hxeB5MX2LMOk
	 CdeGkiHLZaN9aTV5WiSUMpWa/95G2AVI8sAERbKABD4VWy0AyHs+jF7Y2qMcJuDdXZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=NlNO657O;
	arc=none smtp.remote-ip=209.127.231.26
Received: from va-2-26.ptr.blmpb.com (va-2-26.ptr.blmpb.com [209.127.231.26])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4984D606A326
	for <spacemit@lists.linux.dev>; Mon,  2 Nov 2026 06:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4984D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=NlNO657O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1793599229;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=A/tLJoR6OHH3WDx1lVKoWYGKHOjQjb/b8PFhHuwJhxc=;
 b=NlNO657OTtDs1MO3Bi375pa3WRIykXshvZk68y4dublKsxHAI27SUJ2i4l4037ZU2uY84a
 4gvhYleRByst9Zq1qa1a6lrS7vnTq3rdR82akc4OHPea7hy43YyJKy8lQl0P6UjnUzNNU1
 anfp5JHMJ7vz8d2brKrwVjTdMsTAkSDVjt6XEQ/WVGnKuK2AvhEt/46W/KadyRx7YecIRS
 LUAx7xBsVZMsNfg+QM8Q1kEp0+bi7r/mXrjiq6x0R6Orc4ZLOWKC+u15yF+0y/UoLvB0E2
 0cMfr0G3W9Nt9ofaCA5qFgGvaGp3NfU4zJuD8kSc4aOGZLO2DW6K7/MIlwgBkQ==
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH v3 0/3] Enable USB and SD for Deepcomputing FML13V05 board
Message-Id: <20261102060012.100623-1-sandie.cao@deepcomputing.io>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([113.80.9.210]) by smtp.feishu.cn with ESMTPS; Mon, 02 Nov 2026 14:00:26 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Date: Mon,  2 Nov 2026 14:00:12 +0800
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26ae826fb+6f5f2c+lists.linux.dev+sandie.cao@deepcomputing.io>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>

This series updates Deepcomputing FML13V05 Device Tree: Add P1 PMIC 
regulator tree, add USB controller and USB phy, Enable SD card.

This series is rebased on next-20261030.

---
Changes in v3:
- Remove useless gpio header.
- Add Onboard SD Card comment.
- Link to v2: https://lore.kernel.org/all/20261020081633.3673704-1-
sandie.cao@deepcomputing.io/

Changes in v2:
- Remove usb3b, usb3c node define in k3.dtsi, it's already uploaded by 
other patch.
- Add phys and phys-name define for usb3b, usb3c, usb3d in 
k3-deepcomputing-fml13v05.
- Remove cd-gpios, use non-removable for sdhci0. 
- Remove vmmc-supply for sdhci0.
- Link to v1: https://lore.kernel.org/all/20260922110231.3426011-1-
sandie.cao@deepcomputing.io/

---

Sandie Cao (3):
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add P1 PMIC regulator
    tree
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller
    and USB phy support
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card
    support

 .../spacemit/k3-deepcomputing-fml13v05.dts    | 227 ++++++++++++++++++
 1 file changed, 227 insertions(+)


base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
-- 
2.43.0
