"""create tables

Revision ID: d360f215c235
Revises: 77782db1afe7
Create Date: 2023-10-27 17:56:39.541757

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = 'd360f215c235'
down_revision: Union[str, None] = '77782db1afe7'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('medical_records', sa.Column('allergies', sa.String(length=100), nullable=False))
    op.add_column('medical_records', sa.Column('pcp', sa.String(length=100), nullable=False))
    op.add_column('patients', sa.Column('insurance', sa.String(length=100), nullable=False))
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('patients', 'insurance')
    op.drop_column('medical_records', 'pcp')
    op.drop_column('medical_records', 'allergies')
    # ### end Alembic commands ###
