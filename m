Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C7140DB3A;
	Wed, 29 Jul 2026 16:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785341296; cv=none; b=EqNO48NmIutFOzc94YQG0xqH0/8dys3kdd1S6BXfZut2iD+sJXdH/GA5i7df2pRf2n3QRx61Z1crjh/dpYPDyVRmKLo119Rc3ga52coA+bfc8i7aPE897omtU7SYvyCvjT3GZnHSEDnwJCoYXxBp1v/GtqpZJrENgFE6EDWSceg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785341296; c=relaxed/simple;
	bh=SzRk+3g9rCcBobSILuzXyGBBY/ITj5AAdFFSVaC3G/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HKxPlUoqGcNoVSPP3XyIUCjsEQHJfvHOu1D1zkOAobp62IjajbBRCEJ7AAld+mtzWgk3r/lEHmsyVFVIOXclXm3gN002wWl1haxTY/MsHeYClCkoByG//xpmtUWE4PZ2nlIIuUaHaYHAxmVHBcygAPC61nCtbWwzCesXg3JoNYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=ov6BZzt9; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="ov6BZzt9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=17BWj7c/raIegYlq+CdzM9Q9pnzgudwKCzwNuvjl2S8=; b=ov6BZzt9KqNE+X933+2hNN1E4O
	cB30qBoFcQHRGCaW8//oSU05jKZFI7BalnFrocXMuxPSaz4BiwxYFihQq57JwbbpRh46ejJA5DAua
	Oa8kqRMegQ5PYf6QPGbLy8+lse7vHlOEOfuLi5DYU55Nl07iu/1tSLgqQGk0Rrptob7YmH/hEKHFi
	ly+C1EPjrZQvtq6NjAR0aXm7OWKM7RWz/pqRQ7LHKyyVd+q0TBF5G7iM6/gf2euAC18nBuHQHOh7u
	HWyAmhS39wFaJbtbDxhRT0HX9GHyF6V4UoF+EuospidmkGIgxv1RBENdSiCnGzk4I3a6WrooBPOot
	rsY1XJ3g==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp6pB-00000002hus-2tF2;
	Wed, 29 Jul 2026 18:08:05 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Guodong Xu <guodong@riscstar.com>,
	Yangyu Chen <cyy@cyyself.name>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v2 3/4] dt-bindings: riscv: spacemit: add Milk-V Jupiter M1 compatible
Date: Wed, 29 Jul 2026 18:00:30 +0200
Message-ID: <20260729160749.1621415-4-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729160749.1621415-1-aurelien@aurel32.net>
References: <20260729160749.1621415-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the M1 version of the Milk-V Jupiter board, which
use a CPU with a different packaging with improved cooling performance.
It enables the CPU to run at up to 1.8 GHz instead of 1.6 GHz.

Note that the K1 vendor kernel doesn't provide any compatible entry for
the boards, so use "milkv,jupiter-m1".

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 4ee9c88984b4c..aba189b91ae35 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -28,6 +28,7 @@ properties:
           - enum:
               - bananapi,bpi-f3
               - milkv,jupiter
+              - milkv,jupiter-m1
               - spacemit,musepi-pro
               - xunlong,orangepi-r2s
               - xunlong,orangepi-rv2
-- 
2.53.0

