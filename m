Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B748E231830;
	Thu,  5 Mar 2026 01:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772672474; cv=none; b=XdIiFn47NkBwQoP+1VyUyJf2GyUO4aIyhvStdABWmKo53HHuuSOBYvEGr0w1STFCvt/EM2ADcdhOp6aFZXEP4UPIV6NbneF2LZYo/mvPar7iBkefm9Gy3TSws1Tm9QdiTK5CK3KOWar3G+cWlNlGvM92h9Uy1eJ0ioLdGiBOvg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772672474; c=relaxed/simple;
	bh=GURYD6cv/JMm5jM3qsw55jv7RRAQJ3j0qjIAdCjx5DY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pad0o9GVBhgo/yZVvjQUjnfbMDZK2lsXIe8IXkc12EHBTK1vgyWUDqgl4Mx7osHSgoK1WTHzggbKjmz3uQcQ4YKfNO02yVvu+pqIobx5ZMlc6rQbeLXPy9MZ3VcYWMDn/9sqCng9wm/FpOAeWr1RQE5eSNc31nRPBa4FjKgOVSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LXTmiWDe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LXTmiWDe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BDC4C2BCAF;
	Thu,  5 Mar 2026 01:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772672474;
	bh=GURYD6cv/JMm5jM3qsw55jv7RRAQJ3j0qjIAdCjx5DY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LXTmiWDenxzHw6laYParIy93zYr1qAfct79+t+YLZQ2uKHcxfB5E0g1jCl5KaSQ98
	 eDOtIneDq++nDWiwVgflguxNC/zZQyvzn/zYFJT+suliQ2HzbKw5RXgciT3ZhQv7yD
	 zzh//qk0myGqdn+6ek8PSgSb85gBwJiZ/oWqVP3uKk3lGvI9zADcdHuTa+eq2RyY8G
	 u1soZwltWZgIEaM/d3M3ggaBGRpzdl/Y4duaNM9gnGK305XfFr5DEYYISy/iWoswFE
	 szziH15zo+vFHBwiMWUVQaSjjjUul+++n7DTd0kc8Cfxu5PrfrRUTUYFGQMwlMFJPL
	 5tt9dc7w25M/g==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 05 Mar 2026 01:00:51 +0000
Subject: [PATCH v4 1/2] dt-bindings: phy: spacemit: k3: add USB2 PHY
 support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-11-k3-usb2-phy-v4-1-15554fb933bc@kernel.org>
References: <20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org>
In-Reply-To: <20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204; i=dlan@kernel.org;
 h=from:subject:message-id; bh=GURYD6cv/JMm5jM3qsw55jv7RRAQJ3j0qjIAdCjx5DY=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpqNXNYLMSPX3JIB5qTzwbP8PmAUupnsAONHCWI
 0KjF0fKKeaJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaajVzRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0R8A//WuNJ6TuuxBn2h4o4pJDAzkw0BdZ9SXiRUyuhn6hhrjuObMxtq5DdX
 CQqykwTr4vS84WTGVdh/AuJvQxtH3rdi08oWEwCtgUsQNbML8LUzSQg/q36wlM/ES0ySwpfusin
 WWbMnZCaU9niINeV5h0NwSFhiHb7DRfZ/3XWVza0OPdhCMKaSMDZWm5Sga/OnpFczjNKo0uCAGT
 PpnJWViK8zCyYiq+rNvTYGAqMpKlELL6ylRF1lkAU1eLxOwUGHen4AVLam+vbX0e1OinltAlQJ+
 6mZ6dK5HEkmTcwAPVTdpo1+TNERDibeTKHa0SIDXeWMAN0pe7pOHjA1hcKPacKRj3Kp942qVWKc
 teDefp8dWQxl7Tsfskp3n3OU17s3mWaKkrdX+Rk1Yn/qYvz0c6afX3oM86qdwJEpCgGUpMMzAbn
 iX+hZYa8qDo/NoJ75Zqc69vO7f/o2GrDgljB8PGjzXruh4RLq6kGe4pqghc5xgDUIfBn52eK44Q
 qQn7Wn6tTo1QHpvfUU7UuzmkODvoCF+GYUhP9Lp8v8y5vQlk5+4vh0DoiXklFde/liUPzmw78Pp
 rSTWqY/y3VbTqBxOPIGXgVRK2dPRA0mjz8tNOt5r+vKPsy8D9ALQvdn6WZrrTJVXL1IlRfyxuzq
 2063tI/oMlMy0u2g8+d2wkTiVq8XTw=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Introduce a compatible string for the USB2 PHY in SpacemiT K3 SoC. The IP
of USB2 PHY mostly shares the same functionalities with K1 SoC, while has
some register layout changes.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
index 43eaca90d88c..18025e5f60d6 100644
--- a/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
@@ -4,14 +4,16 @@
 $id: http://devicetree.org/schemas/phy/spacemit,usb2-phy.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: SpacemiT K1 SoC USB 2.0 PHY
+title: SpacemiT K1/K3 SoC USB 2.0 PHY
 
 maintainers:
   - Ze Huang <huang.ze@linux.dev>
 
 properties:
   compatible:
-    const: spacemit,k1-usb2-phy
+    enum:
+      - spacemit,k1-usb2-phy
+      - spacemit,k3-usb2-phy
 
   reg:
     maxItems: 1

-- 
2.53.0

