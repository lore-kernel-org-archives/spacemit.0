Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BA71E885A;
	Sat, 24 Jan 2026 17:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769276169; cv=none; b=ZtDeACNOF4ZqX4RnOh+MxFlJxN/IBYWhV6AfJcLlLTWp97w5P+/cnmi0Xxh4aY/gYb22juYB3A8nA1rrFqt/alZAmYw9J0PKS3/j5DPoZvlv4YJJ8et8KEN8m8yvqclgpOkqDr7HTqfFRxKkb7ZFUKLaBSOzFmN49VHqKP9Ksqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769276169; c=relaxed/simple;
	bh=o5yjgO4zWgp3a2Tq1EIDiWeiDjKLYiy1AQcpHao5Pw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PtM/VXOHDc+E/uWEu3ys/FoBeaIzWLgsoTSZ3tZPNE4A4bjfC226miNjyUtLogOewZt6NIdIdsqrMmVJbHldG6fuN+dPBjdtStlhyIh1Y4dHoIkXVjBjuYte+H1kjNzt4AMJFg7+Se5parDI/3RCLdfObQ6ZE5GNHAa25kIg13M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JiCRFFMS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JiCRFFMS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B12DC116D0;
	Sat, 24 Jan 2026 17:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769276169;
	bh=o5yjgO4zWgp3a2Tq1EIDiWeiDjKLYiy1AQcpHao5Pw4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JiCRFFMS3cXmXkLl1+eFI/KX4pzapQG0Wgu4OFpFf2+1EAx0Aq9Clk83+L6j76K5Y
	 wKg1ovP8I/8fKGq432w1ckjIj2g1mKoWUCGV4wicZjb6ld+aDXVeLg7+KtUoDqebCB
	 NWjimzZ2Cg29eSaMQhZhL5OwH1cceR8Zh9LXQ4IbAw+OwwZKBQjMnEPp15FqfeioEz
	 vZexLqHlRFMcEp/u7Za/ByNLqrLqJ4hj/+iicPRfz3I8GHnLdPJUuiebOCo/Gq4jFm
	 BlIS64kDq8YOaY60aZ1Gachst3GUh+B7UqoUZRzaur8hTqjfz0xX6QC5CJTvZhpaUm
	 6bIqEjk+l5osQ==
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor@kernel.org>,
	Yixun Lan <dlan@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: defconfig: spacemit: k3: enable clock support
Date: Sat, 24 Jan 2026 17:35:56 +0000
Message-ID: <20260124-doorbell-configure-1cabad91b176@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260124-06-k3-clk-defconfig-v1-1-802674ef2762@kernel.org>
References: <20260124-06-k3-clk-defconfig-v1-1-802674ef2762@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=404; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=RC1Lsv/701n1KFS/c9HlBZQi7uS9JT7LR+huqDel6F0=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJmlTH+8pra1PfT/wll3+9dcD937ce0589+vnHV/4ZfSe ddvxxae6ihlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEdtcwMlwQWRnx7YpLrLaf qljOnFWRN9wYDjU6+c4yuvc2XuZctRgjw7o/NSkmS9qPPL0v4D/915X5Rt2Jnl9nGu3YdcXhrVX VCxYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Sat, 24 Jan 2026 06:31:28 +0800, Yixun Lan wrote:
> Enable the clock driver support for SpacemiT K3 SoC, configure it as
> built-in by default, but users should be able to change it as kernel
> module if needed.
> 
> 

Applied to riscv-config-for-next, thanks!

[1/1] riscv: defconfig: spacemit: k3: enable clock support
      https://git.kernel.org/conor/c/28edadaa03df

Thanks,
Conor.
