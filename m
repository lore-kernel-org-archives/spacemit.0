Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8C827FD75
	for <spacemit@lists.linux.dev>; Sun, 29 Mar 2026 09:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774776046; cv=none; b=HfbS8yAghY5U5v6xqDQxn+U8gar9x7il1/DjYqdjhx4aC8ePdeai/Oyjyaz9KkikkBCzbE+ZPL4qRqCCzHkDoe7bqeLPxeZTFbzFUsHE5PY6xkiZjBbEZTpKNo/iI43coL2sNR4uiNx4Lo29QYZV9IZzxeu9A4GhFZCnJOK388I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774776046; c=relaxed/simple;
	bh=IzsenYqkDV3+9tNmaGCCPfebzIIP3eioMbhuiFIrBPA=;
	h=Message-ID:Date:MIME-Version:In-Reply-To:To:Cc:From:Subject:
	 Content-Type; b=DYLD17N7011ycQCFAqxkb930Vaia+SxhKl4vjK61adQUnZb/El/GJqPm7k4H6g4c7U3wPJodz6ravi9KZZPE0Od3yZPWUZ2LVzDOOro7LD6p2LUn5BWIeM9AwXsTPLVk01T5ltYTNq65TKsDBimJBMmFpTcM86hrXw74rdJDDYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=online.fr; spf=pass smtp.mailfrom=online.fr; arc=none smtp.client-ip=212.27.42.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=online.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=online.fr
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 6B5D74CFF2
	for <spacemit@lists.linux.dev>; Sun, 29 Mar 2026 11:20:33 +0200 (CEST)
Received: from [10.0.0.2] (unknown [82.65.243.93])
	(Authenticated sender: legoll@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8F1D319F5C6;
	Sun, 29 Mar 2026 11:20:01 +0200 (CEST)
Message-ID: <55c580a0-61cd-435e-bff0-f5f54cbe6948@online.fr>
Date: Sun, 29 Mar 2026 11:20:01 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
In-Reply-To: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>
From: Vincent Legoll <legoll@online.fr>
Subject: Re: [PATCH v4 1/8] mmc: sdhci-of-k1: enable essential clock,
 infrastructure for SD operation
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

I applied this series on top of cbfffcca2bf0622b601b7eaf477aa29035169184 
(linux mainline from yesterday) and successfully booted the resulting 
kernel from an SD card on an OrangePi-RV2 (with the vendor u-boot from 
the SPI flash).

So if you want, you can add my: Tested-by: Vincent Legoll 
<legoll@online.fr> # OrangePi-RV2 to the relevant patches from this 
series Thanks Regards

