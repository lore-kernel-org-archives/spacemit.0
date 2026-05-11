Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0F981ACA;
	Mon, 11 May 2026 04:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778475013; cv=none; b=Gzc1XQ6PoRqn5ZPeT1wkm9N4Qugs6Ztd/rLgYHqibX+1QOoQq75vHcbkXB6brvUy0g3Y4yiu1qlrMAiuR3VCimcW5tBQTw3q5LN+Sekf9AqC/I8ZQ8FXKYBoFhzYj3Zanewoc/FgUJWVgbfNAsjEMIuJfrh8qmq+a2SbVyEgrnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778475013; c=relaxed/simple;
	bh=GnoZ5DrKFM2dwnC3dtM4eqBnszt3yJf8/fmsVTycPc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LH9m0Ac4TKqyfGPNkAYOtLcdBlNeSVFW7QzAZB4/kfEHXFG0cqYPJYtkWqdLIEdDNXB8wrsiRwxwcgJs8KNPfNjB0/wGzp849ITXCVjCPEHR1cAQRyS6qVg87vRejSWsPYsE6MiUsP4uZG7WdBi8ZfJaJHOGOLDN+/7KTX/N/aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r9pbg98y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r9pbg98y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65EA0C2BCB0;
	Mon, 11 May 2026 04:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778475013;
	bh=GnoZ5DrKFM2dwnC3dtM4eqBnszt3yJf8/fmsVTycPc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r9pbg98yWfAANY7vagM2dyoIedkjt3ZJqdb7g+oG4E6IvDYFsOZR2lxIZpz7ELFpU
	 hGur6lEl01QV8lKAusduQumqUY5iM/uhxZrF+dLMxt2N0yVtVhhzbVvBuxz3RnHYDe
	 y+EwknnyrrN6ZeI2AAXfRN9WsWkMqFhKXzZ55+QH9OFhsJMvLnZfkoAeie9Cxl6cSj
	 XL1M/Lmuu2AGw1BB52wOSDDuJDceO0iI7QX+9gF2JovvVD/gZRKt6kYd/fEQSV+I+j
	 7d+jgfVqWiNr94mbE/fIQNdjU3ro/1yZW3YyZtHZeNKH8wZWj1fX/GhtMN/VFP1Oib
	 9QXwpaw+iHnHg==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alex Elder <elder@riscstar.com>,
	Haylen Chu <heylenay@4d2.org>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dts: riscv: spacemit: correct 32k clock frequency
Date: Mon, 11 May 2026 04:50:04 +0000
Message-ID: <177847498895.951618.10632308286447634075.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260428-06-k3-clk-osc32k-v1-1-e2378da7cb9b@kernel.org>
References: <20260428-06-k3-clk-osc32k-v1-1-e2378da7cb9b@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 28 Apr 2026 10:57:29 +0000, Yixun Lan wrote:
> The 32k oscillator's clock frequency is actually 32768Hz, so correct it.

Applied, thanks!

[1/1] dts: riscv: spacemit: correct 32k clock frequency
      https://github.com/spacemit-com/linux/commit/3c350f6284d8ea5e7a9648241b2e9604f2262d42

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
