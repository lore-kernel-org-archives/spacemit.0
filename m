Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D4E3B71D9
	for <spacemit@lists.linux.dev>; Thu, 25 Jun 2026 06:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782369281; cv=none; b=lw7+5h9ewsY0MyouG5weNrvDlilP4ZdlSKMmSEG9jygaqZeWGZmi8yBl7x6xO2zJGgDVwpSPog2M2Krr9mm7BTRjrMQbV45NXuZDhalnoahWIZlOfRuwu2VSha2f8yYaJ4NAswd+vC3wy7fSHgUWAJIeZ2bBB95MVAY2o+7WtLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782369281; c=relaxed/simple;
	bh=pPJM+V25S1ipgaeFsbqIOaJvA6Kl7tnAte71iMTXIZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Qiuhnx5fa+sD6WLfJ7EX4Z0cbTfnsao7tFfIGmqKwiLeuR9e1PVGVA379UpmxptnILDsrECesaJPMXi0D0fUW0nW0J4eHjXp1ridiMKXAugwJZzS5yrVSM3k1gr0UBeq1xq2N5dHplNwnpkLT3neqCHCzowaquA6uY6kfx6TYdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.0.2] (unknown [123.118.218.239])
	by APP-01 (Coremail) with SMTP id qwCowACXOtP3yzxqLBgrAw--.37407S2;
	Thu, 25 Jun 2026 14:34:32 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Thu, 25 Jun 2026 14:34:15 +0800
Subject: [PATCH] riscv: Raise default NR_CPUS for 64BIT to 256
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-riscv-more-nr-cpus-v1-1-5da8c72b9269@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAObLPGoC/yXMQQqDQAxA0atI1g2Mgw7iVcRFJ0abgqMkVQri3
 TvW5Vv8f4CxChu0xQHKu5gsKaN8FECvZ5oYZcgG73xwwdeoYrTjvChjUqR1M2zKuhlirELlCHK
 4Ko/y/U+7/rZt8c30uU5wnj+zt4fSdgAAAA==
X-Change-ID: 20260625-riscv-more-nr-cpus-8158dbb4640c
To: Drew Fustini <fustini@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Lufei Zheng <lufei.zheng@spacemit.com>, 
 Han Gao <gaohan@iscas.ac.cn>, Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.15.2
X-CM-TRANSID:qwCowACXOtP3yzxqLBgrAw--.37407S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww15AFy8JFW7JF18ZryUAwb_yoW8Ary8pw
	sFkFn5Cry5Ars2gFW8ZryxWw4UZFs8W3yY93Wjq345JrsIyr90vrZ7t3Z5Gr1DWr4kJr4F
	yF93Ga4rJF1vyFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

SpacemiT has already produced a 80-core RVA23 RISC-V server [1], and
going further back, the dual-socket SG2042-based Sophgo Pisces has 128
cores (although that had some issues achieving mainline support).
Therefore, an NR_CPUS of 64 is not enough.

Raise default NR_CPUS to 256 for 64BIT (when !RISCV_SBI_V01, since very
old firmware can't support more than 64 cores). The number was picked as
a power of two that is at least double the known max. I believe this
should be the right balance between not wasting too much memory and not
having to touch this too often.

Ubuntu has already been shipping NR_CPUS=512 for riscv64. We have also
been testing NR_CPUS=256 internally at ISCAS and found negligible
performance impact and no ill effects.

Reported-by: Lufei Zheng <lufei.zheng@spacemit.com>
Link: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1140651 # [1]
Suggested-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 3f0a647218e4..c0a6992933e4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -454,7 +454,8 @@ config NR_CPUS
 	range 2 32 if RISCV_SBI_V01 && 32BIT
 	range 2 64 if RISCV_SBI_V01 && 64BIT
 	default "32" if 32BIT
-	default "64" if 64BIT
+	default "64" if RISCV_SBI_V01 && 64BIT
+	default "256" if !RISCV_SBI_V01 && 64BIT
 
 config HOTPLUG_CPU
 	bool "Support for hot-pluggable CPUs"

---
base-commit: ab9de95c9cf952332ab79453b4b5d1bfca8e514f
change-id: 20260625-riscv-more-nr-cpus-8158dbb4640c

Best regards,
--  
Vivian Wang <wangruikang@iscas.ac.cn>

