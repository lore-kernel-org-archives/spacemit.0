Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8BB37BE6C
	for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 16:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785256699; cv=pass; b=QWSYLGLT3UI/8qPbZlPmxHfC9Aa7lAR2fR3kO7/8Uw/TY2VsFSq7XXx8YUZnK7Ms+9Pw6/gzvcy759RKKl21h9Y/Cz4t+fJ0hwvZltRG1ZMJ1xME547Z8Jdhk4aPuatdjfA0Ap81IezGEDPq7Z2jOUlrXCEqKXnpFMrl9ihAKRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785256699; c=relaxed/simple;
	bh=+5G8cvlJjulcmfNzDKWNll7nfoUV4L6iexOHRij9dqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hnf0z3IeTsF4GRxLY4SnO6Ne7nGOUovmqG/7ftYkXPu4ZDcctzMLv7hBFsQy6em7nJHsxqVtEYC0ksAGkOFFH8uz5JNNSbLX5G5/oZ/QL8zZkCHj5Pi+vgBH72kav0x9/zEzYQpvVR6m93Y9Pjm15Tv8AkcQBe0GvFt3ZbJzPYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=XIb9yVEN; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="XIb9yVEN"
ARC-Seal: i=1; a=rsa-sha256; t=1785256690; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gtuVlS8jE6weiIBLWg+KEoMkEHT1geascO8dYPOHeMxXrGa6vzzU1gxaLT7nU2gycbjvPJ3ao8Rh0zduVi7aB9R4YGGcc0ssC2IJGztd9oqZwBBtlAvnX5TNV7yihMF4I8NWQImScxl+T6C3PD06nnuHsWImZmnLNV/TJt9mygU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785256690; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9qRsFI5qSJbVI7G3iUiLm7Rbu9EHQZmcbEMF8jjImyw=; 
	b=HkdO/zEH0PCaPzKzJTtgM9xsgE9/3HqTG3PPBb8tEOQwqGBbOjdeAFQBCwhMK31GrDuAzYc+XLrChx7k6RbtfE6aDkm0VMZT9FHLN2i7qK3P7+5o490q2JeiNEicyKht2d8l0aJNukvvCC5ubQkRbJ5agS+CDlbzoHoGUHG+bUg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785256690;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=9qRsFI5qSJbVI7G3iUiLm7Rbu9EHQZmcbEMF8jjImyw=;
	b=XIb9yVEN+rBZPjr+FcBFcNJDW6OAOwLUR/DxAodnmB0jRVEqcnAJPEvT4XNiEbm3
	Bp+Q0LzUMRCmwbeE1EtKb6RzJUun3psfy3xf02242fd0/Wv1gIIUJwctIyExUtsi7fv
	k7IXPW1RdxWE+u49t6ig6UOPqjoOzcFFkNImR2NM=
Received: by mx.zohomail.com with SMTPS id 1785256689184465.8660851625341;
	Tue, 28 Jul 2026 09:38:09 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 29 Jul 2026 00:36:27 +0800
Subject: [PATCH RFC 1/7] dt-bindings: timer: thead,c900-aclint-mtimer: Add
 SpacemiT K3
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-k3-aclint-v1-1-aef88614d3a5@pigmoral.tech>
References: <20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech>
In-Reply-To: <20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1048;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=+5G8cvlJjulcmfNzDKWNll7nfoUV4L6iexOHRij9dqE=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIybp0y5VFrdBaOjrMuOFhlvnaf1mflhqUdN0syDrTmd
 V6vf7azo5SFQYyLQVZMkYXLX/yftQ7PtyMCrfdh5rAygQxh4OIUgInUJzL8L7ugoqlUqHjolsX+
 6M3L8uWt7k3kWXT7geKsx5/qtqrdM2Jk2KL06KDq58jLDFeY1mz7GbUvauHeTfpRFqIh562l80T
 7uQE=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

Add support for the ACLINT MTIMER found in the SpacemiT K3 SoC. The
hardware provides a ACLINT TIMER unit. Adding riscv,aclint-mtimer as a
fallback compatible allows direct reuse of existing OpenSBI driver.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
index cf7c82e980f6..c9429a2fa364 100644
--- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
+++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
@@ -21,6 +21,10 @@ properties:
           - enum:
               - anlogic,dr1v90-aclint-mtimer
           - const: nuclei,ux900-aclint-mtimer
+      - items:
+          - enum:
+              - spacemit,k3-aclint-mtimer
+          - const: riscv,aclint-mtimer
 
   reg:
     items:

-- 
2.55.0

