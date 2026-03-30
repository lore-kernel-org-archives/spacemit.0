Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58623BB9F2;
	Mon, 30 Mar 2026 10:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867231; cv=none; b=s/OsfPhxiztLoBoC30H35gFWShx5C6/v1/PB4HVXOVbG5uzjQzDfn9sehmRrbcOpxmVNVZunINbs1NjcmmhQRC3zFO9Aba+MZkBgIOYrrTHHohsAp8MUFB996K4DpxK1/h9cBMon2hK/fuKwA3v36P9FuXqdrnhD9jqOCBfl3HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867231; c=relaxed/simple;
	bh=WI4ukfgrdJ8n+H+kW01DlgPU2gCxoy2XvlEt4tloRJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vDcA3kcVaEif/zbobuT/ngN8SKIXuShyroAWkU761OsNwzAd8r9blUGlB6v6lj7DTfKE20t40GrF5z5pE+1M0jSCy4X6mv6/pvyCKVrIdVeOBEWKWcDi5HZe20dqMAHgDtlQmMnYDuUWAeSZkMVXv+0MxEhwNsF8ej5/R065s8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRFokuwR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRFokuwR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10133C2BCB2;
	Mon, 30 Mar 2026 10:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774867231;
	bh=WI4ukfgrdJ8n+H+kW01DlgPU2gCxoy2XvlEt4tloRJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FRFokuwRfN3G/akBM9G6Qm4KOBYQp+oriDOqFDZZcjdjKdkkXBAmQUSC/7VqVO/jh
	 6rocVehmkfTyKqpjzsAqPml4PPbCVFC1LrfP1vNzApCMfxU26qyevggNmL2jiJypQI
	 2pGWPNYob4qGdUrF1yclTua/kTvBLYSFggVLt3WJGlnCPb3eEDeEljt1J+nNUcL29L
	 hRbJhCBjqhWgrfqI6S0rtuuAooJzgsbjVZkTOS7765cJu1ZHqgj727oPMHVFjetDJz
	 zRBEMf3N1SMMjSGnJDPI3ULCG42hIeb7jlmcxtRN+By3mqsZFZKVLVd4Fa/XRn91sJ
	 8sUVG9wHCpelA==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dts: riscv: spacemit: k3: add P1 PMIC regulator tree
Date: Mon, 30 Mar 2026 10:40:26 +0000
Message-ID: <177486715861.1896649.7165378709637841817.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327-02-k3-i2c-v2-1-9c6b374470c6@kernel.org>
References: <20260327-02-k3-i2c-v2-1-9c6b374470c6@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 27 Mar 2026 11:51:18 +0000, Yixun Lan wrote:
> Add the P1 PMIC's regulator topology tree for pico-itx board.
> 
> 

Applied, thanks!

[1/1] dts: riscv: spacemit: k3: add P1 PMIC regulator tree
      https://github.com/spacemit-com/linux/commit/af62a095eb0c3359d477b55ef72d2afd94c83c8f

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
