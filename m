Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF46C42A99
	for <spacemit@lists.linux.dev>; Sun, 28 Sep 2025 04:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759033064; cv=none; b=e4u+bKn+p3wznN2Uiq7Mqo15bZrwWX09faiOTzSc1Vurj90kMGy7JJYapQDQKCfZCT0GT+a5FUzd3pzF1gNlIfLahf7i64QIzeAuu0E1QBTGBYD9A29ftH64a+8a6B0l/CHVBzA83xzAkmPChvPbxyaNqQryy0MXCPkUpc9+Voo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759033064; c=relaxed/simple;
	bh=7ScxQgggjOuHKMIReXIccrp9nn1eRhsA1g9GsW4DL/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TUL7p+KmRwVSM5tg/9JvYn+s2qhtlJS12nqizCzUoC5KWNU44PihyzxP2h9EGe0Mw1OdasUvuGDbGVUCsqwi59FNE2siR4v34ggr7X9q1hjmFjTCa/PokTWU+tDq8G8lTEJUlBOCMH67m6iFYQNPFbSm2OLZCM+wSl+EFM58814=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wxArW5BH; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wxArW5BH"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1759033060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7hnJ9V2+O/9JNd2svkagPx03LH+xVK8zdgO2LOELRXw=;
	b=wxArW5BHqHrxBGaM19jgFpgoUBXnZ+ZDkD1PecV0WVtZhck6LzBCfqGvmv03vk2YBaneKs
	j3OrYbCoB7CNX+Mq4wNzGukhqvGNRyu3IBzdXfF2ixCFhi7+KmgbXNCajnCxgeoMnFZ6Ep
	YG/5Xn2i073rUlLgbTuHXko1AMhXehM=
From: Troy Mitchell <troy.mitchell@linux.dev>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: riscv: spacemit: Add MusePi Pro board
Date: Sun, 28 Sep 2025 12:16:48 +0800
Message-ID: <20250928-k1-musepi-pro-dts-v1-1-5efcca0ce3ae@linux.spacemit.com>
In-Reply-To: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
References: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759032880; l=1047; i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id; bh=Xa406oxoTdde1q8R1dFXjFrJavfAJIsCzaruS6XW7Pk=; b=v7YS7SlCqtK95zADSi3ZhQBZX8b7uh2sBKjUxosZ8j8HR4AfRgvrSaKGia287z5Mgn8AvBu/i I3kQzd2ZF5JCX2w0hGBHP0pRfcGmlRti4+l3Ce2qqdBRVEA0ytAKhza
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519; pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Document the compatible string for the MusePi Pro [1].
It is a 1.8-inch single board computer based on the
SpacemiT K1/M1 RISC-V SoC [2].

Link:
https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf
[1]
https://www.spacemit.com/en/key-stone-k1 [2]

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index c56b62a6299ac24d3cdef7edcdfc407dc62a1846..52fe39296031f21d1c28c4f1ea5ca9fe28caf45a 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -22,6 +22,7 @@ properties:
           - enum:
               - bananapi,bpi-f3
               - milkv,jupiter
+              - spacemit,musepi-pro
               - xunlong,orangepi-rv2
           - const: spacemit,k1
 

-- 
2.51.0

