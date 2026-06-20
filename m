Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B0F374A07;
	Sat, 20 Jun 2026 06:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781938262; cv=none; b=mHfR+iQM9rgibHfkcgEHwG5xtgDiel3I/AzDxUT1JLUybPk/zb0AL5Np7F/Nl9O76XC1NpNvXrZ+Flo9tnhMReNO6IKCxJSAuroDhfyvrdXkhZTx/U/HKe+TpnxZzoAIloMDhA/mDgw2A0xKIwG5t/ETBHOQBiGlHOEiZNZFbXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781938262; c=relaxed/simple;
	bh=Mb+fmPO5XnbgFTrV1fhbckw4ddsvw/0r11sqtNIPgiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jxFMgAVGtZX3000phqQYJsbnfVBOeUXMlS9zaS9+Di28XSIYROGkVzrEtehaqxYbRSl7WatVOKNBqIhKGwJTeQDTSshJgj9WlvK8LX9dMdq47OmNKXb+3aQhVuL83qR225U3KS14sC2WClEl4eCYA7Evq3U0eiDzfzMjDA6viZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=zqOgw3wp; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="zqOgw3wp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=OviHOFRy1QWUk0+YOqcYp6zydhwgz85x/wivs9esC1A=; b=zqOgw3wpzgIniiz3sQ2AqZ3vSe
	afx+4G0HRtu9btU5ekCEm7EpZL6Ft1sXyHgfk5+k9ToQBYne2EOUq6JLCa6nZ5iY3iUCWcKQN/u7a
	7DbgSYIWL+u2q4BI+ql1z2wORq4NxY3UUSl+NI1zjzQ4Thi/G47JbPT+rD8xyX12WVjalTfW5J7nX
	G5ytOTEgfnv92tVTFjdIxMvkYNp+Q0JJ10cLCapuWpF5/kOkrZTZEAGl6Ttmo56maycuBqLaheI3f
	l5r+22MgjRvjnuaRUI6A9N7qmOx0qbBTH5DHQMHDDhGrX9uBxDTBTqA1QjPs+uVvFCZp4txHjclHF
	vaT5+RaQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wap6S-000000006dW-2NRh;
	Sat, 20 Jun 2026 08:22:52 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <guodong@riscstar.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 1/5] riscv: dts: spacemit: set console baud rate on K3 Pico-ITX board
Date: Sat, 20 Jun 2026 08:22:02 +0200
Message-ID: <20260620062238.3199108-2-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260620062238.3199108-1-aurelien@aurel32.net>
References: <20260620062238.3199108-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because the default console's baud rate is not set, defconfig kernels do
not have any serial output on this platform. Set the baud rate to
115200, matching what is used by U-Boot etc on this platform.

Fixes: 7a6131804986 ("riscv: dts: spacemit: add K3 Pico-ITX board support")
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b89c1521e6649..509cebc0c9568 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -18,7 +18,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	memory@100000000 {
-- 
2.53.0

