Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303C335F5E7
	for <spacemit@lists.linux.dev>; Sun, 29 Mar 2026 11:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774785235; cv=none; b=OjGUuy825kZngZHpVuGYPJxB04yjkkFcW9V+ROCh+1kHCm/IelvyiwBwoMUQHqmvBudme37mHckKHJDC8QW19FeQuirUiwhb3skylXRpPkQLfXK3v5e4LgQ/YggNbKIBD5sO9zdiIky8R3ESoIjCnh/AnAM5Qj6DuFo1Z6UrPRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774785235; c=relaxed/simple;
	bh=N+pyk1yZYmIcdFnfaEI6OThM9jG7Px+mkLTdB3oW6cE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=e0NaAmdJt7CbYx8EpWMUJQn9nxXzKgL1eQChttwZCLsCvf5QZ1u6bJODS6Qo7E6o6xaiI6niMauBr7cK6Nc3MKiotYd2SNuKaHJagNq9yhPsnKGJ9YjgCtdgPoIRx0kGNjorzYTnpupfi/fpdB1EZdTn1+xCNghVax8tUpmZx+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=online.fr; spf=pass smtp.mailfrom=online.fr; arc=none smtp.client-ip=212.27.42.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=online.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=online.fr
Received: from [10.0.0.2] (unknown [82.65.243.93])
	(Authenticated sender: legoll@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0486F19F57E;
	Sun, 29 Mar 2026 13:53:28 +0200 (CEST)
Message-ID: <66856fb8-3316-4231-8800-90e52de6d906@online.fr>
Date: Sun, 29 Mar 2026 13:53:28 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] mmc: sdhci-of-k1: enable essential clock,
 infrastructure for SD operation
From: Vincent Legoll <legoll@online.fr>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yixun Lan <dlan@kernel.org>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Anand Moon <linux.amoon@gmail.com>, Trevor Gamblin <tgamblin@baylibre.com>
References: <55c580a0-61cd-435e-bff0-f5f54cbe6948@online.fr>
Content-Language: en-US
In-Reply-To: <55c580a0-61cd-435e-bff0-f5f54cbe6948@online.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/29/26 11:20, Vincent Legoll wrote:
> I applied this series on top of 
> cbfffcca2bf0622b601b7eaf477aa29035169184 (linux mainline from 
> yesterday) and successfully booted the resulting kernel from an SD 
> card on an OrangePi-RV2 (with the vendor u-boot from the SPI flash).
>
> So if you want, you can add my: Tested-by: Vincent Legoll 
> <legoll@online.fr> # OrangePi-RV2 to the relevant patches from this 
> series Thanks Regards


Same for series applied on next-20260327:


Tested-by: Vincent Legoll <legoll@online.fr> # OrangePi-RV2


P.S.: Sorry for the formatting, struggling with thunderbird.


