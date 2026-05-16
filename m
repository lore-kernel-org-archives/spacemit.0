Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA5B213E9C;
	Sat, 16 May 2026 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778936593; cv=none; b=A5KEpqLRBI6JJ/Ynpo+18TkX6Y0o02nBz5q1gpZm9QYf1nxiZEZpWXTc7H6CFpHl6kxkW4ezbWpJApd0ctm/m96MZYh/5EZvPM4ad7ALJIiOf5o8Vt86qd94XKO20Yfleqp26bSsb26Hk5GPYc1zKTszl+zNDuv+cyhXwBBeRL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778936593; c=relaxed/simple;
	bh=dXwJVxBzLDPTQmhMePfb0+XfT5+tnxSv3a1I+i+98DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r+z7d4D9YhqJe4xfvbrCsOX9BC382ie37huDMoActM8biUPU3edMcLZ/rclo2MQmrDKUDEj9RZGp3N82LfLwjB5ey9vR97zdacEj96vWE/3+WCRwQb8WNbRN7UuG8l0sdTT718vIyCb9oAXEPURtufiLMWXLz9c+Op+GogMTWNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tdT+D4gB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tdT+D4gB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92EDC2BCB3;
	Sat, 16 May 2026 13:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778936592;
	bh=dXwJVxBzLDPTQmhMePfb0+XfT5+tnxSv3a1I+i+98DI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tdT+D4gBvPobLn19zUvY24kDKJ0phI+u1qL3gYDYs93tjb7e1U04HsinY3qL/sAHT
	 68FlBmGKL4wIehAyGVQRvQz64Wkti5KdaD9fyqYPARH1/kZ1PKVPkMSbr2gw700beL
	 DVne4Jb0nSugq3iG0ninz4dDpm7I8MejjKCROZGbr+N5v9dhKyfYGJz0X1FDjMlI9P
	 pL3hpKwBTjuIfCSwdISLFfzUhr7qLM+js2p4LpT5glVMiTh8g+uxw3N7tRiZXVQNva
	 9VrmB69jCr30yxthrkjZcs5v/vy53vBsq+9qDbeLjhX4fclzpd4gZQEDml4a579HJn
	 z/IkW5a7g1oMQ==
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable QSPI for OrangePi RV2
Date: Sat, 16 May 2026 13:03:06 +0000
Message-ID: <177893657188.2456968.7429508961699495905.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516080030.1736836-1-amadeus@jmu.edu.cn>
References: <20260516080030.1736836-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 16 May 2026 16:00:30 +0800, Chukun Pan wrote:
> Enable the QSPI controller and the XM25QU128C SPI NOR flash on the
> OrangePi RV2 board. Add a flash partition layout from vendor UBoot.

Applied, thanks!

[1/1] riscv: dts: spacemit: enable QSPI for OrangePi RV2
      https://github.com/spacemit-com/linux/commit/dd5c5b54c3be5a1422f05a23370779235043434d

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
