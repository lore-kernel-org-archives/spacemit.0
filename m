Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372942F8EAE;
	Mon, 11 May 2026 04:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778475038; cv=none; b=nNgucaoVVTHfhVQqkiNBBMa0TcgnF7MUcp34eUIhb7VNELu0/1Vn5p5CHjqcgpMI6Xnbgrz8LY2mPd8rAf4enM7L9etwrdmWKHydZP/WyAKFQvhpTe0rQAB8E4Cmqi3o7ihmzidjPBw9kyjJj2QmVDtJcG/6TmDh5i3zI0mXvuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778475038; c=relaxed/simple;
	bh=iXnH4xL/sNUx84mYT62A403ppNgf+sxnvjWMK1wR7VI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vu/HEfrfe04OQrBa/o1wvWA/L1HU7LU0U0JBJhA/jfcUGNYalaY5V3Xt9KesTy4zocPkvf+C8zLiz8D86IJ3lZdamCk7sBYgSm80KjOGA5CcgZ7CvAmXX/2lO8QFPO6uWh7DST8ucXoORCWMCUlxNZcS9bU6LdfExivMMWzAdIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4Z6LaDl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4Z6LaDl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63B8C2BCB0;
	Mon, 11 May 2026 04:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778475037;
	bh=iXnH4xL/sNUx84mYT62A403ppNgf+sxnvjWMK1wR7VI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L4Z6LaDlRw5xH+3w+HR5VRFc5AbhxsdAuBVB/n6zwvj96hIRrR37T3CkCzjqcTl96
	 s1/i0UK36KRKl+g0shnHIhANpLHdo+MjZ+C3tpY88ehhzj8YH4K3w1ggboINVQ5lLu
	 T4IYkmflVRUkhGX8NvhsiyHAlW/H/CY/akQSPj0e41O/IPIRxWXQrcY0u/wHFarV39
	 z536uO0bxtW7u59fgNkX93V3yW6YHZbIvfAl5rAYJvljJjWfm2AKU71/WSXth/aAa5
	 Kuz9MVifKUoF6MlH8Gse3I0QAqsn4evGIDJOcXuWi0MfcAvyRW4gK4VXipYUL918Kf
	 1ZbGkxs+gL+bg==
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable eMMC for OrangePi RV2
Date: Mon, 11 May 2026 04:50:30 +0000
Message-ID: <177847502723.951835.14416544463790637222.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509100000.3315109-1-amadeus@jmu.edu.cn>
References: <20260509100000.3315109-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 09 May 2026 18:00:00 +0800, Chukun Pan wrote:
> The OrangePi RV2 board has one eMMC slot, so enable eMMC.
> Tested using a 16 GiB AJTD4R eMMC module.

Applied, thanks!

[1/1] riscv: dts: spacemit: enable eMMC for OrangePi RV2
      https://github.com/spacemit-com/linux/commit/f068b204555ad62d6a841a49feb4ea8c4f45b25c

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
