Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEE93A0B27;
	Fri,  6 Mar 2026 13:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804772; cv=none; b=ZNi7cSXa7X62BP144HDU3g8vssbq9VW9FYS9RIuOMLNq2+SswUnAp4xFs20/AJEULsvGKnuYzU9sdPByfb7aeSb9KaZilcnGyAeeh2wzQGqEU9Kxzg9sP8G43n0pQ34AWHYdDdg62RBIQzA4osQ/SoukhASKeHQAeO+jsqe6X28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804772; c=relaxed/simple;
	bh=ZH7mXSzFe4jJDQEYgn8zoZrXrIw5d6O9OOIOunJ33bI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hexkiz7GTVUqpAfoxmQBxPCR+VasSyp70Mqkd4AERBk1T9iCdaaWBmMpnjlaf8NyRm9RM2gY95AQIwGCJjB3r39tMJlfPjvh3SDhi8NfaNaKjmHUoLf/TbNE1fMttbBA+6YX/uGdMzfoNxWtdw29ll/R8kbI7AtiWvUfxU+pzyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=szNE54xx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="szNE54xx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D736C4CEF7;
	Fri,  6 Mar 2026 13:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772804771;
	bh=ZH7mXSzFe4jJDQEYgn8zoZrXrIw5d6O9OOIOunJ33bI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=szNE54xx8n6uEeRywKcJhj20PpeA+C9SMUaZzzyEX4XHyL4X/g79VHinV1D2errfV
	 S0dS53kfuFxbWatIv/z2ilPs7du7enHhd7Z2LMEmwXtx9fxG3YPyiZ3PrzUbAX5Phh
	 geB7JA4fYQab7J49XOjKXvCZLs28zBm0y3ijJI3SGFRUK179akYBpA1ukM8MaWHoAZ
	 b2RdyyBMI+/CZbWtgLyq57ab0n99S/57pJNRPmPLOFaPPUpVK6SQ83BjKcFuD4GlFg
	 teDdNZDKr4lHvdKUXmaC6GcDKJU+5Uq1aHa40bh4ROAg4r832Gl8ElB1MYfvxhd2xB
	 qzNSHiYUsFpVg==
From: Lee Jones <lee@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260206-spacemit-p1-v4-1-8f695d93811e@riscstar.com>
References: <20260206-spacemit-p1-v4-1-8f695d93811e@riscstar.com>
Subject: Re: (subset) [PATCH v4 1/3] dt-bindings: mfd: spacemit,p1: Add
 individual regulator supply properties
Message-Id: <177280476778.1042627.3296790673262334325.b4-ty@kernel.org>
Date: Fri, 06 Mar 2026 13:46:07 +0000
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Fri, 06 Feb 2026 10:32:02 +0800, Guodong Xu wrote:
> Add supply properties that match the P1 PMIC's actual hardware topology
> where each buck converter has its own VIN pin and LDO groups share
> common input pins. Supply names are defined according to the pinout
> names in the P1 datasheet.
> 
> The existing "vin-supply" is dropped from the binding document as the
> updated spacemit P1 driver no longer parses it. Only the per-rail names
> ("vin1-supply", "vin2-supply", ...) are supported.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: mfd: spacemit,p1: Add individual regulator supply properties
      commit: e13ebb4cfcff4399a34c3a89c493020899a431f7

--
Lee Jones [李琼斯]

