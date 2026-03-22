Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2D837C93F;
	Sun, 22 Mar 2026 20:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774211654; cv=none; b=fzzA/RhTRNfL74FS9Ba/3FuhU/fXesYhiz0v/VSslc3FzE6QX8GVrTwpjluXmGc6MwkI19/af2eR2UdR/dHv79m8w1FsefUcZ3Zzu2vBH1RaAlkrdPLcDxrmmj/09DmasjahgqIUmD0eRVfPDyHYDtg6ulccRt1ieJwgrKEBI2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774211654; c=relaxed/simple;
	bh=cPHAbrK6FTfyPvGvlBb7XogSjZH5hirz7BUWC3jvX9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YGnsTyumEjpYuJSexjQIr2gv+O1DQyszwLYIHkCqVi7xCYsDxdjvoepBKsL/3jUc9j2V3g5nTzqJyHoWuwgTfgbhKSdK/45dXG6wmQC2V9axraHjtgGUF4Gkqyob1g6gQTPRshwryTdc5aWGHe02mXic2UHBy4cHhsScQN2yEfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=ibKSkx3e; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="ibKSkx3e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=mkmin+8R4y9Bt/u7qbGdhBTJiWo5NovMdSsDVKb9cOU=; b=ibKSkx3e8/KCDizysi1x6SaJaX
	cUqVcopPZITy1XEWpGQLCNCUC+En+sv7CueSvNM54yHgwRdPmJ3YvBfDvhZvUVox7C/sB2wRXpCqp
	bKUYmrMcl0o5C2Rb/mWpbhVozC93cVl9r0OkoHU8f3HVlj9FOyGr6e4/Ufcsc1zBnmLzsRZm5Y424
	+WEtFJUufqi+oACjEoAMbd8KvuUXDevxqsqRmhpd3M7s7vz4f4SdUuOjxd+FX5tr0n4yp9Llqt616
	l51JwNM73km5inJMFLeuigmD+1kiUwSjbbV9qME8uKJGRP6g0NFqfn4AoIngkpm7rI/fDON+dXTGX
	00dERMrQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w4PUx-0000000Aseb-2Ja8;
	Sun, 22 Mar 2026 21:34:11 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 3/6] riscv: dts: spacemit: add i2c aliases on Milk-V Jupiter
Date: Sun, 22 Mar 2026 21:28:34 +0100
Message-ID: <20260322203356.2206927-4-aurelien@aurel32.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260322203356.2206927-1-aurelien@aurel32.net>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add i2c aliases for i2c2 and i2c8 on Milk-V Jupiter. This is useful to
keep a stable number for the /dev entries after loading the i2c-dev
module.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index bd48208a370cf..836311c3f035c 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -15,6 +15,8 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		serial0 = &uart0;
+		i2c2 = &i2c2;
+		i2c8 = &i2c8;
 	};
 
 	chosen {
-- 
2.51.0

