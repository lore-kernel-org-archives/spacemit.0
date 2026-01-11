Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AC13FF1
	for <spacemit@lists.linux.dev>; Sun, 11 Jan 2026 06:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768113684; cv=none; b=E8XIV3j6i/ia7PJXWlRk3L2/yI898hJdeHpnhVxCzKowuXqvi68GvKECk26+VwZgGcYPa62IoW0Df6oQuXG0g/vRwcCANHNtSFBvt2NKY8W/v8/g1z7nhAdLDcIsT7YyZP0VHA4qlFoSSRDKcCQ90BZ3x0C++JHWWeciwSZN120=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768113684; c=relaxed/simple;
	bh=+KO+tJTbypwCAXRGtXUM10wZGIF4dsIDTzPaW/QdLso=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uOpVDCPg2JUqTSKJfsNQGe4pJDjVbQVGhQ/XoYjBmR+Pkll242N7EJJnA9z/Mo1DfdzsjezPG15oT2HoMhBjiTAG0CsdHguYSw6lyJt267Yn+qZmp+lxjnAJNNt9fZ8ASPoFCptsvrUzl7kaFxsYn1EzJxBiWd1xM+RVWuiEd9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PZgqvYkX; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PZgqvYkX"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768113679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=56OMBFVuoHClJkZZhp3ixlpb+rovPKePY3VizP3ZGbQ=;
	b=PZgqvYkXinKCwk2kRUnekJ0UqA/TlWSZy6Zmjk6rkt124fjOObvxMyqxAwZFX+0c/GWc+F
	9TICcZctdlSFh+5ZwGQ2Fr86ruDEwetRPBKOvy7xx1MqK76IzUomFcDxsk4H0gd61iV/F/
	LGzexdUWei0yzekxfC06+P6tOzlAJZ0=
From: Ze Huang <huang.ze@linux.dev>
Subject: [PATCH v3 0/3] riscv: dts: spacemit: Add USB 3.0 support for K1
Date: Sun, 11 Jan 2026 14:41:01 +0800
Message-Id: <20260111-k1-usb3dts-v2-v3-0-f5ebd546e904@linux.dev>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP1FY2kC/3WOyw6CMBREf4XctTW3Rdviyv8wLvq41UYFbYFgC
 P9uxbXJbM4kczIzZEqRMhyqGRKNMceuLVBvKnBX016IRV8YBAqJHBW7cTZkW/s+s1EwIdBhMEq
 hMFA2z0QhTqvvdP5xotdQtP2vBGsyMdc9HrE/VLsgldNKmQZl4yT6YLmSCmsdrNlzjdZx4aWGr
 +sac9+l93p1FKvsz6sSZCT3jcWgA3FzvMd2mLaeRjgvy/IBi8H6b/YAAAA=
X-Change-ID: 20260107-k1-usb3dts-v2-220c0fa7702a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ze Huang <huang.ze@linux.dev>, Aurelien Jarno <aurelien@aurel32.net>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768113671; l=1479;
 i=huang.ze@linux.dev; s=20250705; h=from:subject:message-id;
 bh=+KO+tJTbypwCAXRGtXUM10wZGIF4dsIDTzPaW/QdLso=;
 b=uasPhocpKwUD8x6PNrkPiB+R8GULdBE/ICIXH1cQFjlK1p0FLNvvl0JKTNrF318otD4enECsa
 KXlxQlROv9aASdgsmgvWzXG6f2qH9/kZ9q8f3NPftr5vtd5fCTi7mwN
X-Developer-Key: i=huang.ze@linux.dev; a=ed25519;
 pk=Kzc4PMu5PTo8eZZQ5xmTNL9jeXcQ9Wml0cs+vlQpBkg=
X-Migadu-Flow: FLOW_OUT

This patch series enables the DWC3 USB 3.0 host controller on the
Spacemit K1 SoC and enables it for the Banana Pi F3 board.

For testing, the following kernel configurations should be enabled:

CONFIG_PHY_SPACEMIT_K1_USB2=y
CONFIG_PHY_SPACEMIT_K1_PCIE=y
CONFIG_USB_DWC3=y
CONFIG_USB_ONBOARD_DEV=y

This series is based on the spacemit k1/for-next branch.

Link: https://github.com/spacemit-com/linux

Signed-off-by: Ze Huang <huang.ze@linux.dev>
---
Changes in v3:
- rename vbus and hub regulator to match schematics
- reorder node reference to keep alphabet order
- drop regulator-always-on in usb hub regulator node
- drop unmanaged vbus-supply in usb host node
- Link to v2: https://lore.kernel.org/r/20260107-k1-usb3dts-v2-v2-0-e659b0f8fe1a@linux.dev

Changes in v2:
- rebased on spacemit k1/for-next
- Link to v1: https://lore.kernel.org/all/20251101-k1-usb3dts-v1-0-dd2660e5740b@linux.dev/

---
Ze Huang (3):
      riscv: dts: spacemit: Add USB2 PHY node for K1
      riscv: dts: spacemit: Add DWC3 USB 3.0 controller node for K1
      riscv: dts: spacemit: Enable USB3.0 on BananaPi-F3

 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 46 +++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 32 +++++++++++++++++
 2 files changed, 78 insertions(+)
---
base-commit: 4f67c877a9069c60dfb1767038fba5180bc12d68
change-id: 20260107-k1-usb3dts-v2-220c0fa7702a

Best regards,
-- 
Ze Huang <huang.ze@linux.dev>

