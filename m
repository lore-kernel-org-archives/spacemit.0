Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058772E8DFC;
	Tue, 24 Mar 2026 06:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774335294; cv=none; b=CxBv4BuYuwh1ZuhGRl9FziuG2lGh5lB5cMFaT4otH4jTo1+N/GgcG2XW6fCU70HZeI7fVPUY/Komet9Awo7ibjTfbSkgeovi0C9ntUYuyD8fMlSqtfvkIub8sHq/WZhUmeq+qMqfbSNMGrDkxoKvhY8GK7xfOP+YY4lLxqhFavw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774335294; c=relaxed/simple;
	bh=t8hglXor6Un0PxqAoIiw1Rbzj+sG/DoZrvhFPIkbBjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VvmvQnoZMPYtR6T4qdZvqKjZLopOpFoKo157bvhyPw9cucLcBPxeXrTBX3b2wKHxx3AWTcJ8dJyA54CkNsW7Dbrf4QfWQfU7mtIMk0qDntJNCNaqpzketEA4Fd/aJdYCkKQVnXEy4twYLEhCPJXsmCPxP+pfEVthXfeorT4jyGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GP5Jo7Xh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GP5Jo7Xh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68679C19424;
	Tue, 24 Mar 2026 06:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774335293;
	bh=t8hglXor6Un0PxqAoIiw1Rbzj+sG/DoZrvhFPIkbBjk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GP5Jo7XhWVUCocMEBIxlhj4htOs3HLT8XmDiLGmJLbJORkbERgf6s/58C0P1ZeqDZ
	 v4SyzJJLPM9OpLtrJ47Nh9N2Oky93FuooLzLQ/XA+9ytIu7jAPP87bx5HfWWJSbBtt
	 3PXvvuR6Z6+IPiftAQW/bKL661LLyA+X1L4oqjFbsuDMmQfwNcPg+UHiX/ygXRQWr2
	 syUXoKCUqqdL0vWKUNZXd8k+6rIcNDUDyceTjM1zoCx1+ylNRDy81ONR5tcuvX0OfM
	 CD/grU5LEuvrR9ohIkRG2tT2wJmeoDtyGTfdnQQT63XZWCNm7utpSDqDZRdOg7B80w
	 TlV+UDvnER1/Q==
From: Yixun Lan <dlan@kernel.org>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alex Elder <elder@riscstar.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Cc: Yixun Lan <dlan@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: dts: spacemit: drop incorrect pinctrl for combo PHY
Date: Tue, 24 Mar 2026 06:54:42 +0000
Message-ID: <177433511340.244330.16976819949660895046.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260322202502.2205755-1-aurelien@aurel32.net>
References: <20260322202502.2205755-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 22 Mar 2026 21:25:01 +0100, Aurelien Jarno wrote:
> The combo PHY on the Banana Pi F3 is used for the USB 3.0 port. The high
> speed differential lanes are always configured as such, and do not
> require a pinctrl entry.
> 
> The existing pinctrl entry only configures PCIe secondary pins, which
> are unused for USB and instead routed to the MIPI CSI1 connector.
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: drop incorrect pinctrl for combo PHY
      https://github.com/spacemit-com/linux/commit/c68360c0d636dae71f766b7b296ddfcf2827ccc7

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
