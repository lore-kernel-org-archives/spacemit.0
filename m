Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794195135;
	b=wjTF8LK9EeJbrvgzjS/0mBRRdJSlCB4n0VTMkSaFOOI5Q8KEqIUrkARCNTCJMsZKwG6M
	 cecIYqESwtWfYHl79qEKSueSVE1treCnH2+wcbr2zpRtW6tXrOSLTG7EOPnHQDLU/c+xx
	 H5pOczSvrTK8r2hZXHqVaZZQfIKcDfYJMmfsiJ3XAPQusuxdi/sfJTdtcY9Es9aEACv6y
	 y39ltNQk75Oosko1D2zxtNa6JVPtvHd60Fd1aYtSODX4NVxhGqunr6Ypeyoi3U3EftyqP
	 XoANmLa/kmGwQZJw3/taE76zr+FlGZjMLWeqCrdUDuXIH2w98UOIsxFW8I24k4yBQnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794195135;
	h=DMARC-Filter:DKIM-Signature:Date:Message-Id:Received:X-Mailer:
	 Subject:Content-Transfer-Encoding:X-Lms-Return-Path:To:Cc:
	 Mime-Version:X-Original-From:From:Content-Type;
	bh=YzDaYCBdSlrb9LFHCCjVU8KX83BPN0Qfxpy4gBXOK+o=;
	b=vmnYPMl3fIF9jOYa+eV/mZ2wJ6ytJIVp/ZKzKIFP49fRGgVUnhq2BDeEHSEkPY5WJWNH
	 O66zelL9+Sta5Si/Uh4ViZg0V1oSdaO6qmOPE4ZuGwDMatkqin2XpWrG3FZk+sRUu0L+V
	 MjMdqCGZ5YRtvXuyEkc7vrb8sMfb2+h+gJI9BXQD7/Q5ecShk4AdyKvKxQbgh7gEo6YIZ
	 8E4n12cFOJc1MPWxQLwcXF3IDttnNhlFRsZhdiFcJcmnF/uIqyCS7x+HlLI4xoT4zXdy4
	 sLWxW1NlP3wz5H8Kh+Lcd426lnwAS67cYx1t+ftp1FjvRYG1bioTFl3noUakl6R9IXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=mazc4Bmw;
	arc=none smtp.remote-ip=209.127.231.28
Received: from va-2-28.ptr.blmpb.com (va-2-28.ptr.blmpb.com [209.127.231.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DC6606A31C
	for <spacemit@lists.linux.dev>; Mon,  9 Nov 2026 03:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12DC6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=mazc4Bmw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794195129;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=YzDaYCBdSlrb9LFHCCjVU8KX83BPN0Qfxpy4gBXOK+o=;
 b=mazc4BmwyxscUch6uiRgmt/4eFAe3sxKGToaNVbJvQVveZgFoCoM4xkGtNJMUT2WOctWyW
 s8V6uikNfzU7SdeF2SUGB32Z34b0wLjmXmNvss1JC0K4BX+H/GPXrPWVIzGfh3L0eToMYy
 mzOsJe+rHfQIO7EsErS3EVIG0toDoLRhbrsEeTbhmkcMgDuzjfWlLSIbs13EM7XMBmVSc9
 OWrML56W/AlCwhrfvsKmXPPWKAAzeqguLrsR/S43lYNhvKW3kHUa7b8bWZVLaG60MAeASZ
 enC0EKytx5p/ddAv1+kFXfgHN/54RA4WfiWypnTFmbJZXDM7JWsvdt7JxqfnSA==
Date: Mon,  9 Nov 2026 11:31:54 +0800
Message-Id: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Mon, 09 Nov 2026 11:32:06 +0800
X-Mailer: git-send-email 2.43.0
Subject: [PATCH v4 0/3] Enable USB and SD for Deepcomputing FML13V05 board
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26af13eb7+6e5a8d+lists.linux.dev+sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8

This series updates Deepcomputing FML13V05 Device Tree: Add P1 PMIC 
regulator tree, add USB controller and USB phy, Enable SD card.

This series is rebased on next-20261105.

---
Changes in v4:
- [patch1]
  - Remove unused reg_aux_vcc3v3.
  - Rename p1@41 to pmic@41.
  - Add regulator-always-on for dldo4.
- [patch3]
  - Correct Onboard SD Card comment.
- Link to v3: https://lore.kernel.org/all/20261102060012.100623-1-
sandie.cao@deepcomputing.io/

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

 .../spacemit/k3-deepcomputing-fml13v05.dts    | 220 ++++++++++++++++++
 1 file changed, 220 insertions(+)


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0
